extends Node2D


const combat_entity := preload("res://entities/combat_scenes/combatant/Combatant.tscn")
const ally_pos := Vector2(121, 160)
const enemy_pos := Vector2(863, 162)

@onready var combat_manager := $CombatManger
@onready var hand := $Hand
@onready var ally_weapon_stack_progress := $"Ally Board/Ally Weapon Stack/ProgressBar"


func _unhandled_input(event):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()


func _ready():
	_init_game_board()
	combat_manager.sort_initiative()
	hand.init_listeners()
	hand.populate_hand()
	ally_weapon_stack_progress.init_listeners()
	


func _init_game_board():
	var enemy_1 := _instantiate_combat_entity(
		load("res://assets/Character Sprites/enemy/goblin/goblin_sprite.png"),
		enemy_pos
	)
	combat_manager.add_child(enemy_1)
	var ally_1 := _instantiate_combat_entity(
		load("res://assets/Character Sprites/Skull/skull_sprite.png"),
		ally_pos,
		true
	)
	combat_manager.add_child(ally_1)


func _instantiate_combat_entity(texture, pos, is_ally := false, initiative_bonus := 0) -> Combatant:
	var entity := combat_entity.instantiate()
	entity.get_node("Sprite2D").texture = texture
	entity.get_node("Sprite2D").hframes = 3
	entity.get_node("Sprite2D").position = pos
	var player_stats = entity.get_node("Stats")
	player_stats.is_ally = is_ally
	player_stats.roll_initiative(initiative_bonus)
	var entity_board = entity.get_node("Board")
	entity_board.deck = GameBoard.get_deck()
	return entity


func _on_pass_turn_pressed():
	combat_manager._next_turn()
