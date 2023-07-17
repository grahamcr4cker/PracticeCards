extends CharacterBody2D

@onready var animation = $AnimationPlayer
var total_health = "res://Class.gd.Priest.total_health"
var mastery_bonus = 3
const roll_indicator = preload("res://roll_result_indicator.tscn")


func updateAnimation():
		animation.play("idle")

func _physics_process(_delta):
	move_and_slide()
	updateAnimation()


func _on_attack_button_pressed():
	var result = randi_range(1,10) + mastery_bonus
	print(result)
	spawn_roll_indicator(result) #doesn't work, causes crash


func spawn_effect(EFFECT: PackedScene, effect_position: Vector2 = global_position):
	if EFFECT:
		var effect = EFFECT.instantiate()
		get_tree().current_scene.add_child(effect)
		effect.global_position = effect_position
		return effect

func spawn_roll_indicator(roll: int):
	var indicator = roll_indicator
	if indicator:
		indicator.label.text = str(roll) #think crash is caused by this. Invalid get index 'label' (on base:PackedScene') 
