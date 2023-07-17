extends CharacterBody2D

@onready var animation = $AnimationPlayer
var total_health = "res://Class.gd.Priest.total_health"


func updateAnimation():
		animation.play("idle")

func _physics_process(_delta):
	move_and_slide()
	updateAnimation()
