extends Button


@onready var combat_manager := $"../CombatManger"


func _on_toggled(button_pressed):
	disabled = button_pressed
	if disabled and combat_manager.curr_turn.get_node("Board").cards_played >= 2:
		combat_manager.curr_turn.get_node("TurnStatus").turnEnded.emit()
