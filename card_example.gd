extends Control

@export var card_texture: Texture
var id

# Called when the node enters the scene tree for the first time.
func _ready():
	CardActions.connect("card_played", was_i_played)
	id = randi() % 999999
	get_node("TextureRect").texture = card_texture


func _get_drag_data(_at_position):
	var data = {}
	data["id"] = id
	data["texture"] = card_texture
	
	var drag_preview = duplicate()
	drag_preview.modulate.a = .5
	drag_preview.find_child("TextureRect").set_position(Vector2(-32, -32))
	
	set_drag_preview(drag_preview)
	
	return data

func was_i_played(card_id):
	if card_id == id:
		queue_free()
