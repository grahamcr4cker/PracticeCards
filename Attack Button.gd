extends Button


func _on_pressed():
	TurnManager.set_turn(TurnManager.CurrentTurn.ENEMY_TURN)
