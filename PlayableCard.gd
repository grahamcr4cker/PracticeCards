extends Sprite2D


class_name PlayableCard

@onready var was_clicked_on := false
@onready var animation_tree := $AnimationTree

#enum SuitType { 
#	WEAPON(0), 
#	ARMOR(1), 
#	CLASS_1(2), 
#	CLASS_2(3)
#}

@export_category("Card")
#@export_enum("Ace", "Jack", "Queen", "King") var card_rank : String
@export var suit_type : CardLibrary.SuitType
#@export var card_name : String = card_rank + " of " + card_suit #'Rank' of 'Suit'
#@export_enum("Face", "Stacker") var card_type
@export var is_face_card : bool
#@export var name : String
@export_multiline var Description : String = ""
@export_range(2, 20, 1) var numeric_value : int

@export_category("Damage/Healing")
@export_range(0, 10, 1) var damage : int
@export_range(0, 10, 1) var healing : int
@export_flags("Sharp", "Blunt", "Poison", "Bleed") var phys_damage_types
@export_flags("Fire", "Cold", "Energy", "Sun") var arc_damage_types

#@export_category("Status Effects")
#@export_flags("Enraged", "Hidden", "Shielded", "Strengthened", "Surged", "Warded") var pos_status_effects
#@export_flags("bleeding", "blinded", "burned", "chilled", "corrupted", "dazed", "exposed", "intimidated", "numbed", "poisoned", "stunned", "taunted", "weakened") var neg_status_effects
var id


func _ready():
	id = randi() % 999999
	animation_tree["parameters/conditions/is_idle"] = true
	

func _on_area_2d_mouse_entered():
	animation_tree["parameters/conditions/is_idle"] = false
	animation_tree["parameters/conditions/is_focused"] = true


func _on_area_2d_mouse_exited():
	animation_tree["parameters/conditions/is_idle"] = true
	animation_tree["parameters/conditions/is_focused"] = false


func _on_area_2d_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_released("leftclick"):
		animation_tree["parameters/conditions/is_clicked"] = true
		await get_tree().create_timer(.6).timeout
		if is_face_card:
			GameBoard.add_in_play_to_stack(duplicate())
		else:
			match suit_type:
				CardLibrary.SuitType.ARMOR:
					GameBoard.add_armor_to_stack(duplicate())
				CardLibrary.SuitType.WEAPON:
					GameBoard.add_weapon_to_stack(duplicate())
				CardLibrary.SuitType.CLASS_1:
					GameBoard.add_class_1_to_stack(duplicate())
				CardLibrary.SuitType.CLASS_2:
					GameBoard.add_class_2_to_stack(duplicate())
				_:
					pass
		
		queue_free()


func _on_tree_exited():
	GameBoard.handCardPopped.emit()
