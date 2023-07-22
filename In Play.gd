extends Node2D


# Space between sprites in pixels
var space_between = -50

# Called when the node enters the scene tree for the first time.
func _ready():
	GameBoard.inPlayAdded.connect(_card_added_to_stack)


func _card_added_to_stack(card):
	add_child(GameBoard.duplicate_card(card))
	var x_position = 0
	for child in get_children():
		child.position.x = x_position
		x_position += child.texture.get_width() + space_between
		child.get_node("Area2D").visible = false
