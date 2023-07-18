extends Control

@onready var roll_result_spawn_point = $"../Roll Result Spawn Point"
@onready var roll_result_template = preload("res://roll_result_indicator.tscn")
@onready var mastery = 3

var end_held = false

#func _on_attack_button_pressed():
#	spawn_roll_result(randi_range(1,10) + mastery)
#
#func spawn_roll_result(value:float):
#	var roll_result = get_roll_result()
#	var val = str(round(value))
#	var pos = roll_result_spawn_point.position
#	add_child(roll_result, true)
#	roll_result.set_values_and_animate(val, pos)
#
#func get_roll_result() -> roll_result_number:
#	return roll_result_template.instantiate()
