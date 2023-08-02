extends ProgressBar


var total_value := 0
@onready var combat_manager := $"../../../CombatManger"


func init_listeners():
	combat_manager.curr_ally.get_node("Board").weaponAdded.connect(_incriment_progress)


func _incriment_progress(card):
	if value + card.numeric_value >= 10:
		value = 0
	value = value + card.numeric_value
