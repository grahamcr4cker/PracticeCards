extends Area2D


@export var cardAddedSignal : String

func _ready():
	GameBoard.connect(cardAddedSignal, _add_card)


func _add_card(old_card):
	var card = GameBoard.duplicate_card(old_card)
	add_child(card)


func _on_child_entered_tree(node):
	if node is PlayableCard:
		node.get_node("Area2D").visible = false
