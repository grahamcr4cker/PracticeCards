extends Node2D

@export var speed : int = 30
@export var friction : int = 15
var shift_direction: Vector2 = Vector2.ZERO

@onready var label = $Label
