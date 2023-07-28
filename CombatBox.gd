extends Node2D


class_name CombatBox

@export var action_status : ActionStatus
@export var player_stats : PlayerStatsPoc

var is_button_pressed := true


func _unhandled_input(event):
	if Input.is_action_just_pressed("attack"):
		print("ATTACK!!!")
		if is_button_pressed:
			action_status.attackMode.emit()
		else:
			action_status.attackCancel.emit()
		is_button_pressed = !is_button_pressed


func _on_attack_button_toggled(button_pressed):
	if button_pressed:
		action_status.attackMode.emit()
	else:
		action_status.attackCancel.emit()


func _on_defend_button_button_up():
	action_status.defend.emit()
