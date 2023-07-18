extends Node2D
class_name roll_result_number

@onready var label:Label = $Label
@onready var label_container:Node2D = $"."
@onready var ap:AnimationPlayer = $AnimationPlayer



# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func set_values_and_animate(value:String, start_pos:Vector2) -> void:
	label.text = value
	ap.play("show_result")
	
	
func remove() -> void:
	queue_free()
