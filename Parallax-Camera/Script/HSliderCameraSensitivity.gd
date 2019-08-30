extends HSlider
"""
Name    : HSliderCameraSensitivity.gd
Summary : Controls the Camera Sensitivity(Gyro Threshold) in the Options Menu
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
	#Retrieve starting value
	value = Globals.Gyro_Threshold
	
	#Set value label
	get_parent().get_node("ValueLabel").text = str(value)

"""
Name   : _on_HSliderCameraSensitivity_value_changed
Summary: Change the Camera Sensitivity(Gyro Threshold) when player uses slider
Input  : value - Current value on slider
Output : None
"""
func _on_HSliderCameraSensitivity_value_changed(value):
	#Change the Camera Sensitivity(Gyro Threshold) to the current value
	Globals.Gyro_Threshold = value
	
	#Update label
	get_parent().get_node("ValueLabel").text = str(value)
""""""