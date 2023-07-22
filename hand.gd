extends Node2D


@onready var attack_button = $"../Attack Button"

@export var hand_count := 5

const ANIMATION_SPEED := .15
var total_card_plays := 2
var cards_played := 0

func _ready():
	GameBoard.handCardPopped.connect(_position_cards)
	GameBoard.cardPoppedFromDeck.connect(_add_card_from_deck)
	TurnManager.allyTurnStarted.connect(_turn_start)
	TurnManager.enemyTurnStarted.connect(_turn_end)
	populate_hand()
	_position_cards()

func _turn_start():
	print("ally turn starting")
	attack_button.disabled = false
	_toggle_card_clickable(true)
	cards_played = 0

func _turn_end():
	print("ally turn ending")
	_toggle_card_clickable(false)
	attack_button.disabled = true


func _add_card_from_deck(card):
	add_child(card)
	_position_cards()

func _position_cards():
	# Space between sprites in pixels
	var space_between = 0
	# Maximum rotation angle in degrees
	var max_angle = 10
	
	if get_tree() != null:
		var tween = get_tree().create_tween().set_parallel(true)
		if get_children().size() <= 1:
			for child in get_children():
				tween.tween_property(child, "rotation_degrees", 0, ANIMATION_SPEED)
				tween.tween_property(child, "position:x", 0, ANIMATION_SPEED)
				tween.tween_property(child, "position:y", 5, ANIMATION_SPEED)
		else:
			# Maximum height for the arch in pixels
			var max_height = 5
			
			var total_width = 0
			for child in get_children():
				total_width += child.texture.get_width() + space_between
			
			# Subtract the last space, which is not needed
			total_width -= space_between
			
			var x_position = -total_width / 2
			var sprite_count  = get_child_count()
			var sprite_count_step = round((float(sprite_count) / 3.))
			max_height += sprite_count_step * (5 + sprite_count_step)
			var angle_step = 2.0 * max_angle / (sprite_count - 1 if sprite_count > 1 else 1) 
			var current_angle = -max_angle
			var index = 0
			for child in get_children():
				tween.tween_property(child, "rotation_degrees", current_angle, ANIMATION_SPEED)

				# Using Arch to calculate the arch ;)
				var relative_index = index / (sprite_count - 1.0)
				var arch = max_height * (4 * relative_index * (1 - relative_index))
				
				tween.tween_property(child, "global_position:x", self.global_position.x + x_position + child.texture.get_width() / 2, ANIMATION_SPEED)
				tween.tween_property(child, "global_position:y", self.global_position.y - arch, ANIMATION_SPEED)
				
				x_position += child.texture.get_width() + space_between
				current_angle += angle_step
				
				index += 1


func populate_hand():
	for index in range(hand_count):
		add_child(GameBoard.pop_card_from_deck())


func _on_child_exiting_tree(node):
	cards_played += 1
	print("cards played: %d" % cards_played)
	if cards_played >= total_card_plays:
		_toggle_card_clickable(false)
		if attack_button.disabled:
			TurnManager.set_turn(TurnManager.CurrentTurn.ENEMY_TURN)

func _toggle_card_clickable(value: bool):
	if cards_played >= total_card_plays:
		for child in get_children():
			child.get_node("Area2D").visible = value
