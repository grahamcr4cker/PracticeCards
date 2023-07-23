extends Node2D


func _ready():
	TurnManager.enemyTurnStarted.connect(_play_enemy_turn)

func _play_enemy_turn():
	var new_label = Label.new()
	new_label.text = "Enemy Turn!!!" 

	new_label.position = Vector2(325, 50)
	
	var dynamic_font = load("res://assets/Fonts/CloisterBlack.ttf")

	new_label.add_theme_font_override("font", dynamic_font)
	new_label.add_theme_font_size_override("font_size", 48)


	add_child(new_label) 
	await get_tree().create_timer(2.0).timeout

	new_label.queue_free()
	TurnManager.set_turn(TurnManager.CurrentTurn.ALLY_TURN)

func _unhandled_input(event):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
