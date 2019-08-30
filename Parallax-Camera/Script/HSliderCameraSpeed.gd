extends HSlider
"""
Name    : HSliderCameraSpeed.gd
Summary : Controls the Camera Speed(Player Speed) in the Options Menu
Author  : Devone Reynolds
"""

"""PUBLIC VARS"""
""""""

"""PRIVATE VARS"""
#Variables shared between scenes
onready var Globals = get_node("/root/Globals")
""""""

"""PUBLIC FX"""
""""""

"""PRIVATE FX"""
"""
Name   : _ready
Summary: Called when the node enters the scene tree for the first time.
Input  : None 
Output : None
"""
func _ready():
	#Retrive starting value
	value = Globals.Player_Speed
	
	#Set value label
	get_parent().get_node("ValueLabel").text = str(value)

"""
Name   : _on_HSliderCameraSpeed_value_changed
Summary: Change the Camera Speed(Player Speed) when player uses slider
Input  : value - Current value on slider
Output : None
"""
func _on_HSliderCameraSpeed_value_changed(value):
	#Change the Camera Speed(Player Speed) to the current value
	Globals.Player_Speed = value
	
	#Update label
	get_parent().get_node("ValueLabel").text = str(value)
""""""


