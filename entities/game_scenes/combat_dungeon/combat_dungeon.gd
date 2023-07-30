extends Node2D

var hoveredElement = null
var selectedElement = null

func _ready():
	TurnManager.enemyTurnStarted.connect(_play_enemy_turn)

func unsetHoveredNode(node):
	if hoveredElement == node:
		hoveredElement = null

# Returns boolean if it is the new top hovered object
func setHoveredNode(node1) -> bool:
	if hoveredElement == null or hoveredElement == node1:
		hoveredElement = node1
		return true
		
	var nodes = get_tree().get_nodes_in_group("clickableObject")
	var hoveredPosition = 0
	var i = 0
	for node in nodes:
		if node == hoveredElement:
			hoveredPosition = i
			break
		i += 1

	var node1Position = 0
	i = 0
	for node in nodes:
		if node == node1:
			node1Position = i
			break
		i += 1

	if node1Position >= hoveredPosition:
		hoveredElement = node1
		return true
	else:
		return false


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
	if event is InputEventMouseButton && event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if hoveredElement == null:
				# No object is being clicked, so deselect selected node
				selectedElement = null
			else:
				# Call left click for only the top object that is being clicked
				hoveredElement.leftMouseClick()
