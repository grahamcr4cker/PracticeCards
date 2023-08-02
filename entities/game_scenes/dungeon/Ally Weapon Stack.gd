extends Sprite2D


var total_value := 0
@onready var combat_manager := $"../../CombatManger"
@onready var progress := $ProgressBar


func init_listeners():
	combat_manager.curr_ally.get_node("Board").weaponAdded.connect(_incriment_progress)


func _incriment_progress(card):
	progress.value = card.numeric_value
