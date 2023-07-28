extends Node2D


class_name CombatBox

@export var action_status : ActionStatus
@export var player_stats : PlayerStatsPoc


func _on_attack_button_toggled(button_pressed):
	if button_pressed:
		action_status.attackMode.emit()
	else:
		action_status.attackCancel.emit()


func _on_defend_button_button_up():
	action_status.defend.emit()
