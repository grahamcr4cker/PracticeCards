extends Node2D

@export var speed : int = 30
@export var friction : int = 15
var shift_direction: Vector2 = Vector2.ZERO

@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
