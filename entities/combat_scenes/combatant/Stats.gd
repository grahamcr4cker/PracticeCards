extends Node2D


class_name Stats


@export var action_status : ActionStatus

var initiative : int
var mastery := 3
var attack := 5
var is_ally := false


func roll_initiative(bonus := 0):
	initiative = (randi() % 100 + 1) + bonus
