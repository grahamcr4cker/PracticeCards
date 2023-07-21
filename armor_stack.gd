extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	GameBoard.armorAdded.connect(_add_card)

func _add_card(old_card):
	print("adding card")
	var card = GameBoard.duplicate_card(old_card)
	add_child(card)
