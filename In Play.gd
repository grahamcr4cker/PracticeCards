extends Area2D


# Space between sprites in pixels
var space_between = -50

# Called when the node enters the scene tree for the first time.
func _ready():
	GameBoard.inPlayAdded.connect(_card_added_to_stack)


func _card_added_to_stack(card):
	var does_exist = false
	for child in get_children():
		if child is PlayableCard:
			if child.suit_type == card.suit_type and child.numeric_value == card.numeric_value:
				does_exist = true
	if !does_exist:
		add_child(GameBoard.duplicate_card(card))
		var x_position = 0
		for child in get_children():
			if child is PlayableCard:
				child.position.x = x_position
				x_position += child.texture.get_width() + space_between
				child.get_node("Area2D").visible = false
	else:
		print("DOUBLE ALERT!!!!!")


func leftMouseClick():
	var display_cards = preload("res://display_cards.tscn").instantiate()
	display_cards.node = self
	get_tree().get_root().get_node("playspace").add_child(display_cards)


func _on_mouse_entered():
	var root = get_tree().get_root().get_node("playspace")
	print(root)
	if root is Node2D:
		root.setHoveredNode(self)


func _on_mouse_exited():
	var root = get_tree().get_root().get_node("playspace")
	print(root)
	if root is Node2D:
		root.unsetHoveredNode(self)
