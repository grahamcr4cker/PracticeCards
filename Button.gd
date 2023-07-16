extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", _on_button_pressed)

func _on_button_pressed():
	get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
