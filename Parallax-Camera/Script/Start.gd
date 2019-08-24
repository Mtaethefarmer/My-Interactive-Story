extends Button

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	#If start button is pressed
	#Change the scene to the World scene
	var error = get_tree().change_scene("res://World.tscn")
	
	#Print error on failure
	if error != OK:
		print("Failed to change scene with error: " + error)
