extends ColorRect

var paused = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	pass

func _on_ColorRectTimer_timeout():
	paused = false
	pass
	
# string - "hello"
# number - 5
# boolean - true or false
