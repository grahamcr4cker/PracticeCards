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
