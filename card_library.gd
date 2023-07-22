extends Node


enum SuitType { WEAPON, ARMOR, CLASS_1, CLASS_2 }

var suits := {
	"heavyarmor": {
		"type": "armor",
		"sub_type": null,
		"cards": []
	},
	"longblade": {
		"type": "weapon",
		"sub_type": null,
		"cards": []
	},
	"mace": {
		"type": "weapon",
		"sub_type": null,
		"cards": []
	},
	"suns": {
		"type": "priest",
		"sub_type": "class_1",
		"cards": []
	},
	"cures": {
		"type": "priest",
		"sub_type": "class_2",
		"cards": []
	},
	"shadows": {
		"type": "thief",
		"sub_type": "class_1",
		"cards": []
	},
	"venom": {
		"type": "thief",
		"sub_type": "class_2",
		"cards": []
	}
}

func _ready():
	for key in suits:
		var suit = suits[key]
		for number in range(1, 14):
			var card_img = "res://assets/Card Art/%s/%s/%d_%s.png" % [suit.type, key, number, key]
			var card = preload("res://PlayableCard.tscn").instantiate()
			card.name = key
			if suit.sub_type != null:
				match suit.sub_type:
					"class_1":
						card.suit_type = SuitType.CLASS_1
					"class_2":
						card.suit_type = SuitType.CLASS_2
					_:
						pass
			else:
				match suit.type:
					"armor":
						card.suit_type = SuitType.ARMOR
					"weapon":
						card.suit_type = SuitType.WEAPON
					_:
						pass
			
			match number:
				1:
					card_img = card_img.replace("1", "ace")
					card.numeric_value = 20
					card.is_face_card = true
				11:
					card_img = card_img.replace("11", "jack")
					card.numeric_value = 20
					card.is_face_card = true
				12:
					card_img = card_img.replace("12", "queen")
					card.numeric_value = 20
					card.is_face_card = true
				13:
					card_img = card_img.replace("13", "king")
					card.numeric_value = 20
					card.is_face_card = true
				_:
					card.numeric_value = number
			card.texture = load(card_img)
			suit.cards.append(card)
