extends Node2D


class_name Combatant

@onready var turn_status := $TurnStatus
@onready var action_status := $ActionStatus
@onready var player_stats := $Stats
@onready var health_box := $HealthBox
@onready var board := $Board

const ANIMATION_SPEED := .25


func _ready():
	turn_status.turnStarted.connect(_turn_started)
	turn_status.turnEnded.connect(_turn_ended)
	health_box.currentHealthChanged.connect(_set_health_value)
	action_status.incomingDamage.connect(_receive_dmg)


func _set_health_value():
	print("Health value: %d" % health_box.current_health)


func _turn_started():
	if !player_stats.is_ally:
		var new_label = Label.new()
		new_label.text = "Enemy Turn!!!"

		new_label.position = Vector2(325, 50)
		
		var dynamic_font = load("res://assets/Fonts/CloisterBlack.ttf")

		new_label.add_theme_font_override("font", dynamic_font)
		new_label.add_theme_font_size_override("font_size", 48)

		get_parent().get_parent().add_child(new_label)
		await get_tree().create_timer(1.0).timeout
		new_label.queue_free()
		turn_status.turnEnded.emit()
	else:
		board.cards_played = 0


func _turn_ended():
	pass


func _receive_dmg(attacker: Combatant):
	var enemy_dmg: int = attacker.get_node("Stats").attack
	if player_stats.is_defending:
		enemy_dmg = int(enemy_dmg * .6)
	health_box.updateHealth.emit(enemy_dmg)
