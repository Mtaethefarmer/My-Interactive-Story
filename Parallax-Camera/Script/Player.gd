extends Node2D

#Globals
onready var Globals = get_node("/root/Globals")

#Alias for child nodes
onready var Body = $KinematicBody2D

#Public Variables
export (int) var Speed              #How fast the player moves on screen in pixels
export (float) var GyroThreshold
export (bool) var Debug = true         #Flag for displaying additional info
export (int) var MinimumHorzontalLimit = 0
export (int) var MaximumHorizontalLimit = 20000

#Private Variables
var Velocity = Vector2()
var Gyroscope = Vector3() #Ranges from (0.0 - 1.0)

func _ready():
	Speed = Globals.Player_Speed
	GyroThreshold = Globals.Gyro_Threshold
	$KinematicBody2D/Camera2D.smoothing_speed = Globals.Camera_Smoothing

#warning-ignore:unused_argument
func _process(delta):
	$KinematicBody2D/Camera2D.position = global_position
	#Make sure the player never leaves the camera view
	position_bounds_check()

#warning-ignore:unused_argument
func _physics_process(delta):
	#Gyroscope rotation on mobile device is default input
    get_input()
	
	#Move player according to the gyro rotation
    Velocity = Body.move_and_slide(Velocity)

func get_input():
	Gyroscope = Input.get_gyroscope() #Raw gyroscope value as a Vector3
	Velocity = Vector2()              #Reset velocity every frame of physics
	
	#Touch Screen
	
	#Debug movement for editor testing
	#LEFT, RIGHT, UP, DOWN
	if Debug:
		if Input.is_action_pressed("ui_left"):
			Velocity.x -= 1
		if Input.is_action_pressed("ui_right"):
			Velocity.x += 1
		if Input.is_action_pressed("ui_up"):
			Velocity.y -= 1
		if Input.is_action_pressed("ui_down"):
			Velocity.y += 1
	
	#LEFT, RIGHT, UP, DOWN
	if Gyroscope.x < -GyroThreshold:
		Velocity.y += 1
	if Gyroscope.x > GyroThreshold:
		Velocity.y -= 1
	if Gyroscope.y > GyroThreshold:
		Velocity.x -= 1
	if Gyroscope.y < -GyroThreshold:
		Velocity.x += 1
	
	Velocity = Velocity.normalized() * Speed * 100
	
func position_bounds_check():
	if Body.position.y < $KinematicBody2D/Camera2D.limit_top:
		Body.position.y = $KinematicBody2D/Camera2D.limit_top
	if Body.position.y > $KinematicBody2D/Camera2D.limit_bottom:
		Body.position.y  = $KinematicBody2D/Camera2D.limit_bottom
	if Body.global_position.x < MinimumHorzontalLimit:
		Body.global_position.x = MinimumHorzontalLimit
	if Body.global_position.x > MaximumHorizontalLimit:
		Body.global_position.x = MaximumHorizontalLimit

func set_gyrothreshold(value):
	GyroThreshold = value
	
func get_gyrothreshold():
	return GyroThreshold