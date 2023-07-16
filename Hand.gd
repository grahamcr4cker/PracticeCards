extends HBoxContainer

var hand := []

# Called when the node enters the scene tree for the first time.
func _ready():
	CardActions.connect("draw_card", _draw_card)
	CardActions.connect("card_played", _remove_card_from_hand)

func _remove_card_from_hand(card_id):
	hand.pop_back()


func _draw_card(card):
	hand.append(card)
	add_child(card)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
