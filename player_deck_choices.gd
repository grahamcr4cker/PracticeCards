extends Node


var _player_deck := []

func add_card(card: PlayableCard):
	print("added card: %s" % str(card))
	_player_deck.append(card)

func pop_card() -> PlayableCard:
	var popped_card = _player_deck.pop_back()
	print("popped card: %s" % str(popped_card))
	return popped_card
	
func get_deck() -> Array:
	return _player_deck

func shuffle_deck():
	print("shuffling deck")
	_player_deck.shuffle()
