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
	card.texture = old_card.texture
	card.numeric_value = old_card.numeric_value
	card.suit_type = old_card.suit_type
	card.is_face_card = old_card.is_face_card
	card.Description = old_card.Description
	return card
