extends Node2D


signal cardLeftHand

@export var hand_count := 9

@onready var attack_button = $"../Attack Button"
@onready var combat_manager = $"../CombatManger"

const ANIMATION_SPEED := .15


func _ready():
	cardLeftHand.connect(_pop_card_from_hand)


func _pop_card_from_hand(card):
	if combat_manager.curr_turn.get_node("Stats").is_ally:
		await get_tree().create_timer(.0001).timeout # Must wait a fraction of a second for the card to actually leave the tree to be able to reposition the cards properly
		var board = combat_manager.curr_turn.get_node("Board")
		board.remove_card_from_hand(card)
		if card.suit_type == 0:
			board.add_weapon_to_stack(card)
		position_cards()
	else:
		print("It's the enemies turn dude! What are you thinking?")


func _position_cards(_card):
	position_cards()


func init_listeners():
	for entity in combat_manager.get_tree().get_nodes_in_group("CombatEntities"):
		entity.get_node("Board").handCardAdded.connect(_card_added_to_hand)
		entity.get_node("Board").handCardPopped.connect(_position_cards)
		entity.get_node("TurnStatus").turnStarted.connect(_activate_cards)

func _activate_cards():
	
	if combat_manager.curr_turn.get_node("Stats").is_ally:
		_toggle_card_clickable(true)
		var hand_size = combat_manager.curr_turn.get_node("Board").hand.size()
		if hand_size < hand_count:
			for index in range(hand_count - hand_size):
				add_child(GameBoard.pop_card_from_deck())
				position_cards()
				await get_tree().create_timer(.25).timeout
		


func populate_hand():
	var curr_ally = combat_manager.curr_ally.get_node("Board")
	for index in range(hand_count):
		curr_ally.add_card_to_hand(curr_ally.pop_card_from_deck())


func _card_added_to_hand(card):
	add_child(card)
	position_cards()


func _on_child_exiting_tree(node):
	combat_manager.curr_turn.get_node("Board").cards_played += 1
	if combat_manager.curr_turn.get_node("Board").cards_played >= combat_manager.curr_turn.get_node("Board").total_card_plays:
		_toggle_card_clickable(false)
		if attack_button.disabled:
			combat_manager._next_turn()


func _toggle_card_clickable(value: bool):
	for card in get_children():
		card.get_node("AnimationTree")["parameters/conditions/is_focused"] = false
		card.get_node("AnimationTree")["parameters/conditions/is_idle"] = true
		card.get_node("Button").visible = value


func position_cards():
	const ANIMATION_SPEED := .15
	const MAX_SCREEN_WIDTH = 900
	# Space between sprites in pixels
	var space_between = 0
	# Maximum rotation angle in degrees
	var max_angle = 10

	if get_tree() != null:
		var child_list := []
		for child in get_children():
			if child is Card:
				child_list.append(child)
		var tween = get_tree().create_tween().set_parallel(true)
		if child_list.size() <= 1:
			for child in child_list:
				tween.tween_property(child, "rotation_degrees", 0, ANIMATION_SPEED)
				tween.tween_property(child, "position:x", 0, ANIMATION_SPEED)
				tween.tween_property(child, "position:y", 5, ANIMATION_SPEED)
		else:
			var sprite_count  = child_list.size()

			# Maximum height for the arch in pixels
			var max_height = 5
			
			var total_width = 0

			for card in child_list:
				total_width += card.texture.get_width() + space_between

			if total_width > MAX_SCREEN_WIDTH:
				var overlap = total_width - MAX_SCREEN_WIDTH
				space_between = (overlap / (sprite_count - 1)) * -1
				total_width = MAX_SCREEN_WIDTH
			
			var x_position = -total_width / 2
			var sprite_count_step = round((float(sprite_count) / 3.))
			max_height += sprite_count_step * (5 + sprite_count_step)
			var angle_step = 2.0 * max_angle / (sprite_count - 1 if sprite_count > 1 else 1) 
			var current_angle = -max_angle
			var index = 0
			for card in child_list:
				tween.tween_property(card, "rotation_degrees", current_angle, ANIMATION_SPEED)

				# Using Arch to calculate the arch ;)
				var relative_index = index / (sprite_count - 1.0)
				var arch = max_height * (4 * relative_index * (1 - relative_index))
				
				tween.tween_property(card, "global_position:x", self.global_position.x + x_position + card.texture.get_width() / 2, ANIMATION_SPEED)
				tween.tween_property(card, "global_position:y", self.global_position.y - arch, ANIMATION_SPEED)

				x_position += card.texture.get_width() + space_between
				current_angle += angle_step
				
				index += 1
