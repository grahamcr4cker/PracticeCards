extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	GameBoard.armorPopped.connect(_add_card)
	GameBoard.weaponPopped.connect(_add_card)
	GameBoard.class1Popped.connect(_add_card)
	GameBoard.class2Popped.connect(_add_card)


func _add_card(card):
	print("adding card")
	card.get_node("Area2D").visible = false
	add_child(card)

func leftMouseClick():
	var display_cards = preload("res://entities/card_scenes/display_cards.tscn").instantiate()
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
