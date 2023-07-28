extends Node2D


class_name TurnManagerPoc

var curr_turn = null
var entities := []


func _ready():
	pass


func _next_turn():
	print("Turn endeded")
	if curr_turn != null:
		set_turn(entities[1])


func _attack_mode_activated():
	for entity in entities:
		var combat_button = entity.get_node("CombatButton")
		var combat_rect = entity.get_node("CombatRect")
		if !entity.get_node("PlayerStatsPoc").is_ally:
			combat_button.visible = true
			combat_rect.visible = true


func _attack_mode_deactivated():
	for entity in entities:
		var combat_button = entity.get_node("CombatButton")
		var combat_rect = entity.get_node("CombatRect")
		if !entity.get_node("PlayerStatsPoc").is_ally:
			combat_button.visible = false
			combat_rect.visible = false


func _attack_mode_exicuted(enemy):
	_attack_mode_deactivated()
	enemy.get_node("ActionStatus").doDamage.emit(curr_turn)
	curr_turn.get_node("TurnStatus")
	curr_turn.get_node("TurnStatus").turnEnded.emit()


func compare_entities(entity1, entity2):
	if entity1.get_node("PlayerStatsPoc").initiative > entity2.get_node("PlayerStatsPoc").initiative:
		return true
	return false


func set_turn(next_entity):
	if curr_turn != null:
		entities.erase(curr_turn)
		entities.append(curr_turn)
#		curr_turn.get_node("TurnStatus").turnEnded.emit()
		curr_turn = next_entity
		curr_turn.get_node("TurnStatus").turnStarted.emit()
	else:
		curr_turn = next_entity
		curr_turn.get_node("TurnStatus").turnStarted.emit()


func print_initiative():
	entities = get_tree().get_nodes_in_group("CombatEntities")
	entities.sort_custom(compare_entities)

	print("first entity: %d" % entities[0].get_node("PlayerStatsPoc").initiative)
	set_turn(entities[0])
	for entity in entities:
		entity.get_node("TurnStatus").turnEnded.connect(_next_turn)
		entity.get_node("ActionStatus").attackMode.connect(_attack_mode_activated)
		entity.get_node("ActionStatus").attackCancel.connect(_attack_mode_deactivated)
		entity.get_node("ActionStatus").attackEnemy.connect(_attack_mode_exicuted)
		print("entity initiative: %d" % entity.get_node("PlayerStatsPoc").initiative)
