extends Control


@onready var anim_player = $AnimationPlayer
@onready var timer = $Timer
@export var card_texture: Texture
@export var front_face := true

var id

# Called when the node enters the scene tree for the first time.
func _ready():
	var card_front = get_node("CardFront")
	card_front.texture = card_texture
	var card_back = get_node("CardBack")
	if front_face:
		card_front.visible = true
		card_back.visible = false
	else:
		card_front.visible = false
		card_back.visible = true
	CardActions.connect("card_played", was_i_played)
	id = randi() % 999999
	

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_released():
			_flip_card()

func _flip_card():
	if not anim_player.is_playing():
		if front_face:
			anim_player.play("flip_front_to_back")
		else:
			anim_player.play("flip_back_to_front")

func _get_drag_data(_at_position):
	var data = {}
	data["id"] = id
	data["texture"] = card_texture
	data["front_face"] = front_face
	
	var drag_preview = duplicate()
	drag_preview.modulate.a = .5
	drag_preview.find_child("CardFront").set_position(Vector2(-32, -32))
	drag_preview.find_child("CardBack").set_position(Vector2(-32, -32))
	
	set_drag_preview(drag_preview)
	
	return data

func was_i_played(card_id):
	if card_id == id:
		queue_free()
