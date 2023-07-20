extends Node

signal CardAddedToWeaponPile

var _player_deck := []
var _weapon_pile := []

func add_card(card: PlayableCard):
	_player_deck.append(card)

func pop_card() -> PlayableCard:
	var popped_card = _player_deck.pop_back()
	return popped_card
	
func get_deck() -> Array:
	return _player_deck

func shuffle_deck():
	_player_deck.shuffle()
	
func add_card_to_weapon_pile(card: PlayableCard):
	print("inside PDC")
	print(card)
	var new_card = preload("res://PlayableCard.tscn").instantiate()
	new_card.texture = card.texture
	new_card.numeric_value = 20
	_weapon_pile.append(new_card)
	CardAddedToWeaponPile.emit()
