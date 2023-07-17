extends Node2D

@onready var player_hand = $"../player_hand"

@export var curve: Curve

const heavy_armor_cards = preload("res://heavy_armor_cards.tscn")

func add_5_cards() -> void:
	for card in player_hand.get_children():
		var hand_ratio = 0.5
		
		if get_child_count() > 1:
			hand_ratio = float(card.get_index())/float(player_hand.get_child_count() -1)
		var destination := hand
	for _x in 5:
		var card = heavy_armor_cards.instantiate()
		add_child(card.duplicate())
		

			



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
