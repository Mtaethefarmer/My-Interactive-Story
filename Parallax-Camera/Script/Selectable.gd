extends Node2D

func _ready():
	#Center the origin of button based on the texture used
	$Button.position = Vector2(-$Button.normal.get_width(), -$Button.normal.get_height())

func _on_Button_pressed():
	$AnimationPlayer.play("rotate")

func _on_Button_released():
	$AnimationPlayer.stop(false)
