extends Area2D


@export var cardAddedSignal : String
@export var cardPoppedSignal : String

var total_value := 0

func _ready():
	GameBoard.connect(cardAddedSignal, _add_card)


func _add_card(old_card):
	var card = GameBoard.duplicate_card(old_card)
	# Remove this logic if not needed later on
	var does_exist = false
	for child in get_children():
		if child is PlayableCard:
			if child.suit_type == card.suit_type and child.numeric_value == card.numeric_value:
				does_exist = true
	if !does_exist:
		total_value += card.numeric_value
		add_child(card)
		if total_value >= 10:
			total_value = 0
			for child in get_children():
				if child is PlayableCard:
					child.queue_free()
					GameBoard.emit_signal(cardPoppedSignal, GameBoard.duplicate_card(child.duplicate()))
	else:
		print("DOUBLE ALERT!!!!!")


func _on_child_entered_tree(node):
	if node is PlayableCard:
		node.get_node("Area2D").visible = false
