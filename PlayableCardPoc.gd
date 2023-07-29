extends Sprite2D


class_name PlayableCardPoc

@onready var was_clicked_on := false
@onready var animation_tree := $AnimationTree
@onready var button := $Button

@export var suit_type : CardLibrary.SuitType
@export var is_face_card : bool
@export var card_name : String
@export_range(2, 20, 1) var numeric_value : int

var id

func _ready():
	id = randi() % 999999
	animation_tree["parameters/conditions/is_idle"] = true


func _on_tree_exited():
	GameBoard.handCardPopped.emit()


func _on_texture_button_mouse_entered():
	animation_tree["parameters/conditions/is_idle"] = false
	animation_tree["parameters/conditions/is_focused"] = true


func _on_texture_button_mouse_exited():
	animation_tree["parameters/conditions/is_idle"] = true
	animation_tree["parameters/conditions/is_focused"] = false


func _on_texture_button_button_up():
	if animation_tree["parameters/conditions/is_focused"] == true:
		animation_tree["parameters/conditions/is_clicked"] = true
		button.visible = false
		await get_tree().create_timer(.3).timeout
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
