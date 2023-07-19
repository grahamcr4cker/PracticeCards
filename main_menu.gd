extends Control


var player_suites := []
@onready var play_game := $"Play Game"
@onready var heavy_armor_button := $"Heavy Armor Option"
@onready var longblad_button := $"Longblade Option"
@onready var mace_button := $"Mace Option"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_suites.size() == 0:
		play_game.disabled = true
	else:
		play_game.disabled = false


func _on_heavy_armor_option_toggled(button_pressed):
	if button_pressed:
		player_suites.append("heavy_armor")
	else:
		player_suites.erase("heavy_armor")


func _on_longblade_option_toggled(button_pressed):
	if button_pressed:
		player_suites.append("longblade")
	else:
		player_suites.erase("longblade")


func _on_mace_option_toggled(button_pressed):
	if button_pressed:
		player_suites.append("mace")
	else:
		player_suites.erase("mace")


func _on_play_game_pressed():
	for suite in player_suites:
		match suite:
			"heavy_armor":
				add_cards_to_player_deck(preload("res://cards/armor/heavy armor/heavy_armor_cards.tscn").instantiate())
			"longblade":
				add_cards_to_player_deck(preload("res://cards/weapon/longblade/longblade_cards.tscn").instantiate())
			"mace":
				add_cards_to_player_deck(preload("res://cards/weapon/mace/mace_cards.tscn").instantiate())
			_:
				pass
	PlayerDeckChoices.shuffle_deck()
	get_tree().change_scene_to_file("res://combat_dungeon.tscn")

func add_cards_to_player_deck(card_list_scene: Node):
	for card in card_list_scene.get_children():
		PlayerDeckChoices.add_card(card.duplicate())

