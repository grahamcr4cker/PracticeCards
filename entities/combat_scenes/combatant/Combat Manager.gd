extends Node2D


class_name CombatManger

var curr_turn = null
var curr_selection = null
var curr_ally = null
var entities := []

@onready var hand := $"../Hand"
@onready var attack_button := $"../Attack Button"


func _next_turn():
	if curr_turn != null:
		set_turn(entities[1])
	if curr_turn.get_node("Stats").is_ally:
		print("undisabling button")
		attack_button.disabled = false
		attack_button.button_pressed = false


func _attack_mode_activated():
	pass
#	for entity in entities:
#		var combat_button = entity.get_node("CombatButton")
#		var combat_rect = entity.get_node("CombatRect")
#		if !entity.get_node("Stats").is_ally:
#			combat_button.visible = true
#			combat_rect.visible = true


func _attack_mode_deactivated():
	pass
#	for entity in entities:
#		var combat_button = entity.get_node("CombatButton")
#		var combat_rect = entity.get_node("CombatRect")
#		if !entity.get_node("Stats").is_ally:
#			combat_button.visible = false
#			combat_rect.visible = false


func _attack_mode_exicuted(enemy):
	_attack_mode_deactivated()
	enemy.get_node("ActionStatus").incomingDamage.emit(curr_turn)
	curr_turn.get_node("TurnStatus").turnEnded.emit()


func compare_entities(entity1, entity2):
	if entity1.get_node("Stats").initiative > entity2.get_node("Stats").initiative:
		return true
	return false


func set_turn(next_entity):
	if curr_turn != null:
		entities.erase(curr_turn)
		entities.append(curr_turn)
		curr_turn = next_entity
		if curr_turn.get_node("Stats").is_ally == true:
			curr_ally = curr_turn
		curr_turn.get_node("TurnStatus").turnStarted.emit()
	else:
		curr_turn = next_entity
		curr_turn.get_node("TurnStatus").turnStarted.emit()


func sort_initiative():
	entities = get_tree().get_nodes_in_group("CombatEntities")
	entities.sort_custom(compare_entities)

	set_turn(entities[0])
	for entity in entities:
		if entity.get_node("Stats").is_ally and curr_ally == null:
			curr_ally = entity
		entity.get_node("TurnStatus").turnEnded.connect(_next_turn)
		entity.get_node("ActionStatus").attackMode.connect(_attack_mode_activated)
		entity.get_node("ActionStatus").attackCancel.connect(_attack_mode_deactivated)
		entity.get_node("ActionStatus").attackEnemy.connect(_attack_mode_exicuted)
