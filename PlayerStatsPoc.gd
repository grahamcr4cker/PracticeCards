extends Node2D


class_name PlayerStatsPoc

@export var action_status : ActionStatus

var initiative : int
var mastery := 3
var attack := 5
var is_ally := false
var is_defending := false


func activate_defence():
	is_defending = true
	
#	rotate(90)
#	action_status.defend.emit()


func deactivate_defence():
	is_defending = false
#	rotate(-90)


func roll_initiative(bonus := 0):
	initiative = (randi() % 100 + 1) + bonus
