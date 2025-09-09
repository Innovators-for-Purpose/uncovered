extends CanvasLayer

# Declare member variables here. Examples:
export var paused = true# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pass # Replace with function body.


var gotovent_shown = false
#func _process(delta):
#	pass


func _on_Area2_body_entered(body):
	if body.name == "MC" and gotovent_shown == false:

		get_node("/root/RootScene/BASEMENT/go to vent text/Timer").start(5)
		gotovent_shown = true
		
	pass # Replace with function body.


func _on_Timer_timeout():
	visible = false
	pass # Replace with function body.
