extends Node2D

# Space between sprites in pixels
var space_between = 0
# Maximum rotation angle in degrees
var max_angle = 10
# Maximum height for the arch in pixels
var max_height = 5

func _ready():
	var total_width = 0
	for child in get_children():
		total_width += child.texture.get_width() + space_between

	# Subtract the last space, which is not needed
	total_width -= space_between
	
	var x_position = -total_width / 2
	var sprite_count = get_child_count()
	var sprite_count_step = round((float(sprite_count) / 3.))
	max_height += sprite_count_step * (5 + sprite_count_step)
	var angle_step = 2.0 * max_angle / (sprite_count - 1 if sprite_count > 1 else 1)
	var current_angle = -max_angle
	var index = 0
	for child in get_children():
		child.global_position.x = self.global_position.x + x_position + child.texture.get_width() / 2
		child.rotation_degrees = current_angle
		# Using Arch to calculate the arch ;)
		var relative_index = index / (sprite_count - 1.0)
		var arch = max_height * (4 * relative_index * (1 - relative_index))
		child.global_position.y = self.global_position.y - arch
		
		x_position += child.texture.get_width() + space_between
		current_angle += angle_step
		
		index += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
