extends Area2D

@onready var hand := $CardStack
# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerDeckChoices.CardAddedToWeaponPile.connect(_add_card)
#	populate_hand()
	pass

func populate_hand():
	hand.add_child(PlayerDeckChoices.pop_card())

func _add_card():
#	print(card)
	var old_card = PlayerDeckChoices._weapon_pile.pop_back()
	print("***suit type***")
	print(old_card.numeric_value)
#	hand.add_child(card)
	var card = preload("res://card_example.tscn").instantiate()
	card.texture = old_card.texture
#	card.suit_type = old_card.suit_type
#	card.card_type = old_card.card_type
#	card.face_value = old_card.face_value
#	card.numeric_value = old_card.numeric_value
	hand.add_child(card)
