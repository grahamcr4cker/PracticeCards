extends Node2D


const VP_WIDTH := 960
const VP_HIEGHT := 540

const Y_CHUNK := VP_HIEGHT / 4
const X_CHUNK := VP_WIDTH / 4

const ENEMY_Y := Y_CHUNK
const ALLY_Y := Y_CHUNK * 3

const POS_1 := X_CHUNK
const POS_2 := X_CHUNK * 2
const POS_3 := X_CHUNK * 3

const combat_entity := preload("res://PlayerPoc.tscn")

@onready var turn_manager_poc = $TurnManagerPoc


func _unhandled_input(event):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()


func _ready():
	_create_game_board()
	turn_manager_poc.print_initiative()


func _create_game_board():
	var enemy_1 := _instantiate_combat_entity(
		load("res://assets/Card Art/warrior/lions/ace_lions.png"),
	)
	enemy_1.position.x = POS_1
	enemy_1.position.y = ENEMY_Y
	turn_manager_poc.add_child(enemy_1)
	var enemy_2 := _instantiate_combat_entity(
		load("res://assets/Card Art/thief/shadows/ace_shadows.png"),
	)
	enemy_2.position.x = POS_2
	enemy_2.position.y = ENEMY_Y
	turn_manager_poc.add_child(enemy_2)
	var enemy_3 := _instantiate_combat_entity(
		load("res://assets/Card Art/chronomancer/oracles/ace_oracles.png"),
	)
	enemy_3.position.x = POS_3
	enemy_3.position.y = ENEMY_Y
	turn_manager_poc.add_child(enemy_3)
	
	var ally_1 := _instantiate_combat_entity(
		load("res://assets/Card Art/flametongue/wax/ace_wax.png"),
		true,
		30
	)
	ally_1.position.x = POS_1
	ally_1.position.y = ALLY_Y
	turn_manager_poc.add_child(ally_1)
	var ally_2 := _instantiate_combat_entity(
		load("res://assets/Card Art/chronomancer/paths/ace_paths.png"),
		true,
	)
	ally_2.position.x = POS_2
	ally_2.position.y = ALLY_Y
	turn_manager_poc.add_child(ally_2)
	var ally_3 := _instantiate_combat_entity(
		load("res://assets/Card Art/priest/suns/ace_suns.png"),
		true,
	)
	ally_3.position.x = POS_3
	ally_3.position.y = ALLY_Y
	turn_manager_poc.add_child(ally_3)


func _instantiate_combat_entity(texture, is_ally := false, initiative_bonus := 0) -> PlayerPoc:
	var entity := combat_entity.instantiate()
	entity.get_node("Sprite2D").texture = texture
	var player_stats = entity.get_node("PlayerStatsPoc")
	player_stats.is_ally = is_ally
	player_stats.roll_initiative(initiative_bonus)
	return entity
