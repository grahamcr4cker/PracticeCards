extends Node2D


@onready var attack_button = $"../Attack Button"

@export var hand_count := 5

const ANIMATION_SPEED := .15
var total_card_plays := 2
var cards_played := 0

func _ready():
	GameBoard.handCardPopped.connect(_position_cards)
	GameBoard.cardPoppedFromDeck.connect(_add_card_from_deck)
	TurnManager.allyTurnStarted.connect(_turn_start)
	TurnManager.enemyTurnStarted.connect(_turn_end)
	populate_hand()
	_position_cards()


func _position_cards():
	GameBoard.position_cards(get_tree(), get_children(), self)


func _turn_start():
	attack_button.disabled = false
	_toggle_card_clickable(true)
	cards_played = 0
	var hand_size = get_children().size()
	if hand_size < hand_count:
		for index in range(hand_count - hand_size):
			add_child(GameBoard.pop_card_from_deck())
			await get_tree().create_timer(.25).timeout


func _turn_end():
	_toggle_card_clickable(false)
	attack_button.disabled = true


func _add_card_from_deck(card):
	add_child(card)
	_position_cards()


func populate_hand():
	for index in range(hand_count):
		add_child(GameBoard.pop_card_from_deck())


func _on_child_exiting_tree(node):
	cards_played += 1
	if cards_played >= total_card_plays:
		_toggle_card_clickable(false)
		if attack_button.disabled:
			TurnManager.set_turn(TurnManager.CurrentTurn.ENEMY_TURN)


func _toggle_card_clickable(value: bool):
	for child in get_children():
		child.get_node("Area2D").visible = value
