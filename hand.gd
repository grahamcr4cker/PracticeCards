extends Node2D

const CARD = preload("res://cards/armor/heavy armor/five_of_heavy_armor.tscn")
@onready var hand = $"."
@export var spread_curve = Curve

func _ready():
	add_5_cards()
	set_hand_ratio()

func set_hand_ratio():
	for card in hand.get_children():
		var hand_ratio = 0.5
		var destination = hand.global_transform
		if get_child_count() > 1:
			hand_ratio = float(card.get_index())/float(hand.get_child_count() -1)
		
		
func add_5_cards() -> void:
	for _x in 5:
		var card = CARD.instantiate()
		add_child(card)
