extends HSlider
"""
Name    : HSliderCameraSmoothing.gd
Summary : Controls the Camera Smoothing Speed (pixels/sec) in the Options Menu
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
	value = Globals.Camera_Smoothing
	
	#Set value label
	get_parent().get_node("ValueLabel").text = str(value)
	
"""
Name   : _on_HSliderCameraSmoothing_value_changed
Summary: Change the Camera Smoothing when player uses slider
Input  : value - Current value on slider
Output : None
"""
func _on_HSliderCameraSmoothing_value_changed(value):
	#Change the Camera Smoothing(Player Speed) to the current value
	Globals.Camera_Smoothing = value
	
	#Update label
	get_parent().get_node("ValueLabel").text = str(value)
""""""