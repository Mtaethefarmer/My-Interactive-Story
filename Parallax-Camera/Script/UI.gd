extends Control

func _ready():
	pass

func _input(event):
	#Determine where the user touched on the mobile device using global mouse position
	if event is InputEventScreenTouch or event is InputEventMouseButton and event.get_button_index() == BUTTON_LEFT:
		var world_pos = get_global_mouse_position()
		$ScreenPosLabel.text = "Touched @: " + str(world_pos)
		$ScreenPosLabel.rect_global_position = world_pos