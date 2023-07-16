extends ColorRect


@export var card_color: Color

# Called when the node enters the scene tree for the first time.
func _ready():
	var color_rect = get_node("ColorRect")
	color_rect.set("color", card_color)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
