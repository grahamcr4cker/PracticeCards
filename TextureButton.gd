extends TextureButton

var deck := []
@onready var hand = $"../BackgroundDropZone2/Hand"
@onready var dz = $"../BackgroundDropZone/DropZone"

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", _on_button_pressed)
	for suit in ["spades", "hearts", "diamonds", "clubs"]:
		for number in range(1, 14):
			var card_img = "res://assets/card_%s_%02d.png" % [suit, number]
			match number:
				1:
					card_img = card_img.replace("01", "A")
				11:
					card_img = card_img.replace("11", "J")
				12:
					card_img = card_img.replace("12", "Q")
				13:
					card_img = card_img.replace("13", "K")
				_:
					pass
			var card = preload("res://card_example.tscn").instantiate()
			card.card_texture = load(card_img)
			card.front_face = true
			deck.append(card)
	deck.shuffle()
	for card in hand.get_children():
		dz.add_child(card.duplicate())
		card.queue_free()
	
func _on_button_pressed():
	print("draw card")
	var drawn_card = deck.pop_back()
	CardActions.emit_signal("draw_card", drawn_card)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
