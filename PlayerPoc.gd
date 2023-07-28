extends Sprite2D


class_name PlayerPoc

@onready var turn_status := $TurnStatus
@onready var action_status := $ActionStatus
@onready var player_stats := $PlayerStatsPoc
@onready var combat_box := $CombatBox
@onready var outline := $ColorRect
@onready var health_box := $HealthBox
@onready var health_value := $HealthValue

const ANIMATION_SPEED := .25


func _ready():
	combat_box.visible = false
	turn_status.turnStarted.connect(_turn_started)
	turn_status.turnEnded.connect(_turn_ended)
	health_box.currentHealthChanged.connect(_set_health_value)
#	action_status.attackMode.connect()
	action_status.doDamage.connect(_receive_dmg)
#	action_status.attackCancel.connect()
	action_status.defend.connect(_defend)


func _set_health_value():
	health_value.text = str(health_box.current_health)


func _turn_started():
	outline.visible = true
	if player_stats.is_ally:
		combat_box.visible = true
		outline.color = Color(0, 0, 1, .5)
	else:
		outline.color = Color(1, 0, 0, .5)
	if player_stats.is_defending:
		player_stats.deactivate_defence()
		var tween = get_tree().create_tween()
		tween.tween_property(self, "rotation_degrees", 0, ANIMATION_SPEED)
	combat_box.position.y = 67.5
	add_child(combat_box)
	print("Turn started with initiative value of %d" % player_stats.initiative)
	if !player_stats.is_ally:
		await get_tree().create_timer(2.0).timeout
		_defend()


func _turn_ended():
	combat_box.visible = false
	outline.visible = false
	print("Turn ended with initiative value of %d" % player_stats.initiative)


func _defend():
	print("defense ending turn")
	player_stats.activate_defence()
	var tween = get_tree().create_tween()
	tween.tween_property(self, "rotation_degrees", 90, ANIMATION_SPEED)
	turn_status.turnEnded.emit()


func _receive_dmg(attacker: PlayerPoc):
	print("Receiving dmg!!!")
	var enemy_dmg: int = attacker.get_node("PlayerStatsPoc").attack
	if player_stats.is_defending:
		enemy_dmg = int(enemy_dmg * .6)
	health_box.updateHealth.emit(enemy_dmg)
#	turn_status.turnEnded.emit()


func _on_combat_button_button_up():
	action_status.attackEnemy.emit(self)
