extends Sprite2D


@onready var combat_manager := $"../../CombatManger"


func init_listeners():
	for combatant in combat_manager.get_tree().get_nodes_in_group("CombatEntities"):
		combatant.get_node("Board").discardAdded.connect(_add_to_discard)


func _add_to_discard(card):
	add_child(card)

