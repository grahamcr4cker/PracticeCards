extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	CardActions.connect("draw_card", _draw_card)

func _draw_card(card):
	add_child(card)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
