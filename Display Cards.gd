extends Control

@export var node : Node
@onready var card_holder := $"Card Holder"

func _ready():
	for child in node.get_children():
		if child is PlayableCardPoc:
			child.get_node("Button").visible = false
			card_holder.add_child(GameBoard.duplicate_card(child))
	GameBoard.position_cards(card_holder.get_tree(), card_holder.get_children(), card_holder)


func _on_panel_gui_input(event):
	if Input.is_action_just_released("leftclick"):
		queue_free()
