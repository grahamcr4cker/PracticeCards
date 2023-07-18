extends CharacterBody2D
#Player stuff vvv
@onready var animation = $AnimationPlayer
var total_health = "res://Class.gd.Priest.total_health"
var mastery_bonus = 3


func updateAnimation():
		animation.play("idle")

func _physics_process(_delta):
	move_and_slide()
	updateAnimation()


#func spawn_effect(EFFECT: PackedScene, effect_position: Vector2 = global_position):
#	if EFFECT:
#		var effect = EFFECT.instantiate()
#		get_tree().current_scene.add_child(effect)
#		effect.global_position = effect_position
#		return effect

#func spawn_roll_indicator(result: int):
#	var indicator = roll_indicator.instantiate()
#	if indicator:
#		indicator.label = (result) #think crash is caused by this. Invalid get index 'label' (on base:PackedScene') 


	#get a result from the pool vvv
#	if roll_result_pool.size() > 0:
#		return roll_result_pool.pop_front()
#
#	else:
#		var new_roll_result = roll_result_template.instantiate()
#		new_roll_result.tree_exiting.connect(
#			func():roll_result_pool.append(new_roll_result))
#		return new_roll_result
