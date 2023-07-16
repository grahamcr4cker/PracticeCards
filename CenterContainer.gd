extends HBoxContainer

@export var card: PackedScene = null

var played := []

func _can_drop_data(_at_position, _data):
	return true

func _drop_data(_at_position, data):
	var dropped_card = card.instantiate()
	
	played.append(dropped_card)
	add_child(dropped_card)
	dropped_card.find_child("CardFront").texture = data["texture"]
	
	CardActions.emit_signal("card_played", data["id"])
