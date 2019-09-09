extends Control

enum TEXT_COUNTER {SWIVEL=0, CROSSHAIR, MAINMENU}
var page : int = 0

func _ready():
	$CanvasLayer/Background/SwivelTutorial.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	#Show to the next page in the tutorial
	match page:
		TEXT_COUNTER.SWIVEL:
			$CanvasLayer/Background/SwivelTutorial.show()
		TEXT_COUNTER.CROSSHAIR:
			$CanvasLayer/Background/SwivelTutorial.hide()
			$CanvasLayer/Background/OrientationTutorial.show()
		TEXT_COUNTER.MAINMENU:
			$CanvasLayer/Background/OrientationTutorial.hide()
			$CanvasLayer/Background/MainMenuTutorial.show()
		_:
			if $CanvasLayer/Background.hide():
				$CanvasLayer/Background.show()
			else:
				$CanvasLayer/Background.hide()
	
	page+=1
