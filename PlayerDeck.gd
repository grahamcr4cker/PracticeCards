extends Sprite2D


func _ready():
	pass


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_released("leftclick"):
		GameBoard.pop_card_from_deck()
