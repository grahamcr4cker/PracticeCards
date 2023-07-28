extends Node2D


class_name HealthBox

signal updateHealth(health)
signal currentHealthChanged
signal death

@export var max_health := 50
var current_health : int


func _ready():
	current_health = max_health
	updateHealth.connect(_set_health)


func _set_health(health):
	print("received health: %d" % health)
	if current_health - health > max_health:
		current_health = max_health
	else:
		current_health = current_health - health
	print("current health: %d" % current_health)
	currentHealthChanged.emit()
	if current_health >= 0:
		death.emit()
