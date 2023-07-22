extends CharacterBody2D
#Player stuff vvv
@onready var animation = $AnimationPlayer
@onready var roll_indicator = $"../Roll Result Indicator" # No need to preload this, it's already a child in the same scene, we can access it directly
@onready var attack_button = $"../Attack Button"
var total_health = "res://Class.gd.Priest.total_health"
var mastery_bonus = 3


func updateAnimation():
	animation.play("idle")

func _physics_process(_delta):
	move_and_slide()
	updateAnimation()
	
func _on_attack_button_pressed():
	var result = randi_range(1,10) + mastery_bonus
	spawn_roll_indicator(result)
	# This disables the attack button while the animation is playing
	attack_button.disabled = true
	await get_tree().create_timer(2.0).timeout
	attack_button.disabled = false

func spawn_roll_indicator(result: int):
	if roll_indicator:
		roll_indicator.get_node("Label").text = str(result)
		roll_indicator.get_node("AnimationPlayer").play("show_result")
