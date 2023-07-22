extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	GameBoard.weaponAdded.connect(_add_card)

func _add_card(old_card):
	var card = GameBoard.duplicate_card(old_card)
	add_child(card)


func _on_child_entered_tree(node):
	if node is PlayableCard:
		node.get_node("Area2D").visible = false
