extends HBoxContainer

@export var card: PackedScene = null

var played := []

func _can_drop_data(_at_position, _data):
	return true

func _drop_data(_at_position, data):
	var dropped_card = card.instantiate()
	
	print("data: ", data)
	played.append(dropped_card)
	dropped_card.card_texture = data["texture"]
	dropped_card.front_face = data["front_face"]
	add_child(dropped_card)
	
	CardActions.emit_signal("card_played", data["id"])
