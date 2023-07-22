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
signal handCardPopped

var armor := []
var weapon := []
var class_1 := []
var class_2 := []
var discard := []

func add_armor_to_stack(card):
	armor.append(card)
	armorAdded.emit(card)

func add_weapon_to_stack(card):
	weapon.append(card)
	weaponAdded.emit(card)

func add_class_1_to_stack(card):
	class_1.append(card)
	class1Added.emit(card)

func add_class_2_to_stack(card):
	class_2.append(card)
	class2Added.emit(card)

func add_discard_to_stack(card):
	discard.append(card)
	discardAdded.emit(card)

func pop_armor_from_stack() -> PlayableCard:
	var card = armor.pop_back()
	armorPopped.emit(card)
	return card

func pop_weapon_from_stack() -> PlayableCard:
	var card = weapon.pop_back()
	weaponPopped.emit(card)
	return card

func pop_class_1_from_stack() -> PlayableCard:
	var card = class_1.pop_back()
	class1Popped.emit(card)
	return card

func pop_class_2_from_stack() -> PlayableCard:
	var card = class_2.pop_back()
	class2Popped.emit(card)
	return card

func pop_discard_from_stack() -> PlayableCard:
	var card = discard.pop_back()
	discardPopped.emit(card)
	return card

func duplicate_card(old_card) -> PlayableCard:
	var card = preload("res://PlayableCard.tscn").instantiate()
	card.texture = old_card.texture
	card.numeric_value = old_card.numeric_value
	card.suit_type = old_card.suit_type
	card.is_face_card = old_card.is_face_card
	card.Description = old_card.Description
	return card
