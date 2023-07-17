extends TextureButton

#@onready var player_hand = $"../hand"
#@onready var heavy_armor = preload("res://heavy_armor_cards.tscn").instantiate()
#
#func _ready():
#	for card in heavy_armor.get_children():
#		player_hand.add_child(card.duplicate())

	# print(player_hand.get_children()) #<- this print indicates that all 13 cards are in the hand, for sure. We just need to figure out how to display them in the 2D node or Hbox.
	
#	var heavy_armor_card = heavy_armor.get_children()
#	var top_card = heavy_armor_card.pop_back().duplicate()
#	var not_top_card = heavy_armor_card.pop_back().duplicate()
#	player_hand.add_child(not_top_card)
	#player_hand.add_child(top_card)
	
