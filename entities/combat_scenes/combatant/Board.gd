extends Node2D


class_name Board

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
signal handCardRemoved
signal cardPoppedFromDeck
signal inPlayAdded
signal inPlayPopped

var deck := []
var hand := []
var discard := []
var weapon_stack := []
var armor_stack := []
var class_1_stack := []
var class_2_stack := []
var in_play := []

var total_card_plays := 2
var cards_played := 0


func add_card_to_deck(card: Card):
	deck.append(card)


func pop_card_from_deck() -> Card:
	var popped_card = deck.pop_back()
	cardPoppedFromDeck.emit(popped_card)
	return popped_card


func get_deck() -> Array:
	return deck


func shuffle_deck():
	deck.shuffle()


func add_armor_to_stack(card: Card):
	armor_stack.append(card)
	armorAdded.emit(card)


func add_weapon_to_stack(card: Card):
	weapon_stack.append(card)
	weaponAdded.emit(card)
	var total_sum = 0
	for node in weapon_stack:
		total_sum += node.numeric_value
	if total_sum >= 10:
		for _node in weapon_stack:
			add_discard_to_stack(pop_weapon_from_stack())


func add_class_1_to_stack(card: Card):
	class_1_stack.append(card)
	class1Added.emit(card)


func add_class_2_to_stack(card: Card):
	class_2_stack.append(card)
	class2Added.emit(card)


func add_discard_to_stack(card: Card):
	discard.append(card)
	discardAdded.emit(card)


func add_card_to_hand(card: Card):
	hand.append(card)
	handCardAdded.emit(card)


func add_in_play_to_stack(card: Card):
	in_play.append(card)
	inPlayAdded.emit(card)


func pop_armor_from_stack() -> Card:
	var card = armor_stack.pop_back()
	armorPopped.emit(armor_stack.pop_back())
	return card


func pop_weapon_from_stack() -> Card:
	var card = weapon_stack.pop_back()
	weaponPopped.emit(weapon_stack.pop_back())
	return card


func pop_class_1_from_stack() -> Card:
	var card = class_1_stack.pop_back()
	class1Popped.emit(class_1_stack.pop_back())
	return card


func pop_class_2_from_stack() -> Card:
	var card = class_2_stack.pop_back()
	class2Popped.emit(class_2_stack.pop_back())
	return card


func pop_discard_from_stack() -> Card:
	var card = discard.pop_back()
	discardPopped.emit(discard.pop_back())
	return card


func pop_card_from_hand() -> Card:
	var card = hand.pop_back()
	handCardPopped.emit(card)
	return card

func remove_card_from_hand(card):
#	var id = hand.find(card)
#	hand.remove_at(id)
	for i in range(hand.size()):
		if hand[i] == null:
			hand.remove_at(i)
			break
	handCardRemoved.emit()


func pop_in_play_from_stack() -> Card:
	var card = in_play.pop_back()
	inPlayPopped.emit(in_play.pop_back())
	return card


#func duplicate_card(old_card) -> Card:
#	var card = preload("res://entities/card_scenes/Card.tscn").instantiate()
#	card.id = old_card.id
#	card.texture = old_card.texture
#	card.numeric_value = old_card.numeric_value
#	card.suit_type = old_card.suit_type
#	card.is_face_card = old_card.is_face_card
#	return card
