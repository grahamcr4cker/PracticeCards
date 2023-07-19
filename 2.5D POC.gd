extends Node3D


const ZOOM_LERP: float = .65

@onready var spring_arm_pivot := $SpringArmPivot
@onready var spring_arm := $SpringArmPivot/SpringArm3D

var current_speed: float = 0
var zoom_speed: float = 10
var zoom_step: float = .5
var min_distance: float = 1
var max_distance: float = 5

func _unhandled_input(event):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	
#	if Input.is_action_just_pressed("shake"):
#		animation_player.play("shake")

#	if event is InputEventMouseButton:
#		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#	elif event.is_action_pressed("cancel"):
#		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

#	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
	if Input.is_action_just_pressed("left"):
#		spring_arm_pivot.rotate_y(-event.relative.x * .005)
		spring_arm.rotate_y(.05)
#		spring_arm.rotation.x = clamp(spring_arm.rotation.x, -PI/4, PI/4)
	if Input.is_action_just_pressed("right"):
	#		spring_arm_pivot.rotate_y(-event.relative.x * .005)
			spring_arm.rotate_y(-.05)

#	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
#		if Input.is_action_pressed("zoom_in"):
#			var zoom_in = clamp(spring_arm.get_length() - zoom_step, min_distance, max_distance)
#			spring_arm.set_length(lerp(spring_arm.get_length(), zoom_in, ZOOM_LERP))
#		if Input.is_action_pressed("zoom_out"):
#			var zoom_out = clamp(spring_arm.get_length() + zoom_step, min_distance, max_distance)
#			spring_arm.set_length(lerp(spring_arm.get_length(), zoom_out, ZOOM_LERP))
			
# Called when the node enters the scene tree for the first time.
func _ready():
#	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
