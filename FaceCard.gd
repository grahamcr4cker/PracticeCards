extends Sprite2D

@export var card_texture: Texture
@export_category("Card")
#@export_enum("Ace", "Jack", "Queen", "King") var card_rank : String
@export_enum("Class 1", "Class 2", "Weapon", "Armor") var card_suit : String
#@export var card_name : String = card_rank + " of " + card_suit #'Rank' of 'Suit'
@export_placeholder("Placeholder") var Hover_text: String = "Placeholder"
@export_multiline var Description : String = ""

@export_category("Damage/Healing")
@export_range(0, 10, 1) var damage : int
@export_range(0, 10, 1) var healing : int
@export_flags("Sharp", "Blunt", "Poison", "Bleed") var phys_damage_types
@export_flags("Fire", "Cold", "Energy", "Sun") var arc_damage_types

@export_category("Status Effects")
@export_flags("Enraged", "Hidden", "Shielded", "Strengthened", "Surged", "Warded") var pos_status_effects
@export_flags("bleeding", "blinded", "burned", "chilled", "corrupted", "dazed", "exposed", "intimidated", "numbed", "poisoned", "stunned", "taunted", "weakened") var neg_status_effects

func _ready():
	texture = card_texture
