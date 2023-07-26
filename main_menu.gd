extends Control

var player_suites := []

@onready var play_game := $"Play Game"
@onready var heavy_armor_button := $"Selection Wrapper/Armor Selection/Heavy Armor Option"
@onready var light_armor_button := $"Selection Wrapper/Armor Selection/Light Armor Option"
@onready var longblade_button := $"Selection Wrapper/Weapon Selection/Longblade Option"
@onready var mace_button := $"Selection Wrapper/Weapon Selection/Mace Option"
@onready var priest_button := $"Selection Wrapper/Class Selection/Priest Option"
@onready var thief_button := $"Selection Wrapper/Class Selection/Thief Option"
@onready var warrior_button := $"Selection Wrapper/Class Selection/Warrior Option"
@onready var chronomancer_button := $"Selection Wrapper/Class Selection/Chronomancer Option"


func _process(delta):
	if player_suites.size() == 4:
		play_game.disabled = false
	else:
		play_game.disabled = true


func _on_heavy_armor_option_toggled(button_pressed):
	if button_pressed:
		player_suites.append("heavyarmor")
		player_suites.erase("lightarmor")
		heavy_armor_button.disabled = true
		light_armor_button.disabled = false
		print(player_suites)


func _on_light_armor_option_toggled(button_pressed):
	if button_pressed:
		player_suites.append("lightarmor")
		player_suites.erase("heavyarmor")
		light_armor_button.disabled = true
		heavy_armor_button.disabled = false
		print(player_suites)


func _on_longblade_option_toggled(button_pressed):
	if button_pressed:
		player_suites.append("longblade")
		player_suites.erase("mace")
		longblade_button.disabled = true
		mace_button.disabled = false
		print(player_suites)


func _on_mace_option_toggled(button_pressed):
	if button_pressed:
		player_suites.append("mace")
		player_suites.erase("longblade")
		mace_button.disabled = true
		longblade_button.disabled = false
		print(player_suites)


func _on_thief_option_toggled(button_pressed):
	if button_pressed:
		player_suites.append("shadows")
		player_suites.append("venom")
		player_suites.erase("suns")
		player_suites.erase("cures")
		player_suites.erase("shadows")
		player_suites.erase("venom")
		player_suites.erase("oracles")
		player_suites.erase("paths")
		thief_button.disabled = true
		priest_button.disabled = false
		warrior_button.disabled = false
		chronomancer_button.disabled = false
		print(player_suites)


func _on_priest_option_toggled(button_pressed):
	if button_pressed:
		player_suites.append("suns")
		player_suites.append("cures")
		player_suites.erase("shadows")
		player_suites.erase("venom")
		player_suites.erase("shadows")
		player_suites.erase("venom")
		player_suites.erase("oracles")
		player_suites.erase("paths")
		priest_button.disabled = true
		thief_button.disabled = false
		warrior_button.disabled = false
		chronomancer_button.disabled = false
		print(player_suites)


func _on_warrior_option_toggled(button_pressed):
	if button_pressed:
		player_suites.append("lions")
		player_suites.append("standards")
		player_suites.erase("shadows")
		player_suites.erase("venom")
		player_suites.erase("oracles")
		player_suites.erase("paths")
		player_suites.erase("suns")
		player_suites.erase("cures")
		warrior_button.disabled = true
		thief_button.disabled = false
		chronomancer_button.disabled = false
		priest_button.disabled = false
		print(player_suites)


func _on_chronomancer_option_toggled(button_pressed):
	if button_pressed:
		player_suites.append("oracles")
		player_suites.append("paths")
		player_suites.erase("shadows")
		player_suites.erase("venom")
		player_suites.erase("suns")
		player_suites.erase("cures")
		player_suites.erase("lions")
		player_suites.erase("standards")
		chronomancer_button.disabled = true
		thief_button.disabled = false
		priest_button.disabled = false
		warrior_button.disabled = true
		print(player_suites)


func _on_play_game_pressed():
	for suite in player_suites:
		match suite:
			"heavyarmor":
				add_cards_to_player_deck(CardLibrary.suits["heavyarmor"].cards)
			"lightarmor":
				add_cards_to_player_deck(CardLibrary.suits["lightarmor"].cards)
			"longblade":
				add_cards_to_player_deck(CardLibrary.suits["longblade"].cards)
			"mace":
				add_cards_to_player_deck(CardLibrary.suits["mace"].cards)
			"suns":
				add_cards_to_player_deck(CardLibrary.suits["suns"].cards)
			"cures":
				add_cards_to_player_deck(CardLibrary.suits["cures"].cards)
			"shadows":
				add_cards_to_player_deck(CardLibrary.suits["shadows"].cards)
			"venom":
				add_cards_to_player_deck(CardLibrary.suits["venom"].cards)
			"oracles":
				add_cards_to_player_deck(CardLibrary.suits["oracles"].cards)
			"paths":
				add_cards_to_player_deck(CardLibrary.suits["paths"].cards)
			"lions":
				add_cards_to_player_deck(CardLibrary.suits["lions"].cards)
			"standards":
				add_cards_to_player_deck(CardLibrary.suits["standards"].cards)
			_:
				pass
	GameBoard.shuffle_deck()
	GameBoard.shuffle_deck()
	get_tree().change_scene_to_file("res://combat_dungeon.tscn")

func add_cards_to_player_deck(card_list):
	for card in card_list:
		print(card)
		GameBoard.add_card_to_deck(card)
