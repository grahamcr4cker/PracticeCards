extends Node


enum CurrentTurn { ALLY_TURN, ENEMY_TURN }

var turn := CurrentTurn.ALLY_TURN

signal allyTurnStarted
signal enemyTurnStarted

func set_turn(curr_turn: CurrentTurn):
	turn = curr_turn
	match turn:
		CurrentTurn.ALLY_TURN: allyTurnStarted.emit()
		CurrentTurn.ENEMY_TURN: enemyTurnStarted.emit()
