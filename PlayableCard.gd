extends Sprite2D


class_name PlayableCard

@onready var was_clicked_on := false
@onready var animation_tree := $AnimationTree

enum SuitType { CLASS_2, ARMOR, WEAPON, CLASS_1 }
enum CardFace { FACE, STACKER }
enum FaceValue { ACE, KING, QUEEN, JACK, None }

@export_category("Card")
#@export_enum("Ace", "Jack", "Queen", "King") var card_rank : String
@export var suit_type : SuitType
#@export var card_name : String = card_rank + " of " + card_suit #'Rank' of 'Suit'
@export var card_type : CardFace
#if card_type is "Face":
@export var face_value : FaceValue
@export_range(2, 20, 1) var numeric_value : int
@export_multiline var Description : String = ""

@export_category("Damage/Healing")
@export_range(0, 10, 1) var damage : int
@export_range(0, 10, 1) var healing : int
@export_flags("Sharp", "Blunt", "Poison", "Bleed") var phys_damage_types
@export_flags("Fire", "Cold", "Energy", "Sun") var arc_damage_types

#@export_category("Status Effects")
#@export_flags("Enraged", "Hidden", "Shielded", "Strengthened", "Surged", "Warded") var pos_status_effects
#@export_flags("bleeding", "blinded", "burned", "chilled", "corrupted", "dazed", "exposed", "intimidated", "numbed", "poisoned", "stunned", "taunted", "weakened") var neg_status_effects

func _ready():
	animation_tree["parameters/conditions/is_idle"] = true
	

func _on_area_2d_mouse_entered():
	animation_tree["parameters/conditions/is_idle"] = false
	animation_tree["parameters/conditions/is_focused"] = true


func _on_area_2d_mouse_exited():
	animation_tree["parameters/conditions/is_idle"] = true
	animation_tree["parameters/conditions/is_focused"] = false


func _on_area_2d_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_released("leftclick"):
		was_clicked_on = true
		_on_card_clicked()


func _on_card_clicked():
	var card = duplicate()
	card.numeric_value = numeric_value
	queue_free()
	print("card freed!")
	print(suit_type)
	PlayerDeckChoices.add_card_to_weapon_pile(card)
#	SignalBus.card_clicked.emit(card)

