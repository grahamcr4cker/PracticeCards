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
	await get_tree().create_timer(1.0).timeout
	attack_button.disabled = false

func spawn_roll_indicator(result: int):
	if roll_indicator:
		roll_indicator.get_node("Label").text = str(result)
		roll_indicator.get_node("AnimationPlayer").play("show_result")

#func spawn_effect(EFFECT: PackedScene, effect_position: Vector2 = global_position):
#	if EFFECT:
#		var effect = EFFECT.instantiate()
#		get_tree().current_scene.add_child(effect)
#		effect.global_position = effect_position
#		return effect

	#get a result from the pool vvv
#	if roll_result_pool.size() > 0:
#		return roll_result_pool.pop_front()
#
#	else:
#		var new_roll_result = roll_result_template.instantiate()
#		new_roll_result.tree_exiting.connect(
#			func():roll_result_pool.append(new_roll_result))
#		return new_roll_result
