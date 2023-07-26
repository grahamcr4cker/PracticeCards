extends Node

signal armorAdded
signal armorPopped
signal weaponAdded
signal weaponPopped
signal class1Added
signal class1Popped
signal class2Added
signal class2Popped
signal discardAdded
signal discardPopped
signal handCardAdded
signal handCardPopped
signal cardPoppedFromDeck
signal inPlayAdded
signal inPlayPopped

var _player_deck := []

func add_card_to_deck(card: PlayableCard):
	_player_deck.append(card)

func pop_card_from_deck() -> PlayableCard:
	var popped_card = _player_deck.pop_back()
	cardPoppedFromDeck.emit(popped_card)
	return popped_card

func get_deck() -> Array:
	return _player_deck

func shuffle_deck():
	_player_deck.shuffle()

func add_armor_to_stack(card: PlayableCard):
	armorAdded.emit(card)

func add_weapon_to_stack(card: PlayableCard):
	weaponAdded.emit(card)

func add_class_1_to_stack(card: PlayableCard):
	class1Added.emit(card)

func add_class_2_to_stack(card: PlayableCard):
	class2Added.emit(card)

func add_discard_to_stack(card: PlayableCard):
	discardAdded.emit(card)

func add_card_to_hand(card: PlayableCard):
	handCardAdded.emit(card)

func add_in_play_to_stack(card: PlayableCard):
	inPlayAdded.emit(card)

func pop_armor_from_stack():
	armorPopped.emit()

func pop_weapon_from_stack():
	weaponPopped.emit()

func pop_class_1_from_stack():
	class1Popped.emit()

func pop_class_2_from_stack():
	class2Popped.emit()

func pop_discard_from_stack():
	discardPopped.emit()

func pop_card_from_hand():
	handCardPopped.emit()

func pop_in_play_from_stack():
	inPlayPopped.emit()

func duplicate_card(old_card) -> PlayableCard:
	var card = preload("res://PlayableCard.tscn").instantiate()
	card.id = old_card.id
	card.texture = old_card.texture
	card.numeric_value = old_card.numeric_value
	card.suit_type = old_card.suit_type
	card.is_face_card = old_card.is_face_card
	return card

func position_cards(tree, children, holder_node):
	const ANIMATION_SPEED := .15
	# Space between sprites in pixels
	var space_between = 0
	# Maximum rotation angle in degrees
	var max_angle = 10
	
	if tree != null:
		var child_list := []
		for child in children:
			if child is PlayableCard:
				child_list.append(child)
		var tween = tree.create_tween().set_parallel(true)
		if child_list.size() <= 1:
			for child in child_list:
				tween.tween_property(child, "rotation_degrees", 0, ANIMATION_SPEED)
				tween.tween_property(child, "position:x", 0, ANIMATION_SPEED)
				tween.tween_property(child, "position:y", 5, ANIMATION_SPEED)
		else:
			# Maximum height for the arch in pixels
			var max_height = 5
			
			var total_width = 0
			for card in child_list:
				total_width += card.texture.get_width() + space_between
			
			# Subtract the last space, which is not needed
			total_width -= space_between
			
			var x_position = -total_width / 2
			var sprite_count  = child_list.size()
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
				
				tween.tween_property(card, "global_position:x", holder_node.global_position.x + x_position + card.texture.get_width() / 2, ANIMATION_SPEED)
				tween.tween_property(card, "global_position:y", holder_node.global_position.y - arch, ANIMATION_SPEED)
				
				x_position += card.texture.get_width() + space_between
				current_angle += angle_step
				
				index += 1
