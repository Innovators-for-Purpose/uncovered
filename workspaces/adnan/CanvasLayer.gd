extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# print($NinePatchRect)
<<<<<<< HEAD:workspaces/adnan/CanvasLayer.gd
	$InstructionsBackground.visible = false
	# var n = get_node("/root/RootScene/BASEMENT/ColorRect")
=======
	#$InstructionsBackground.visible = false
	var n = get_node("/root/RootScene/BASEMENT/ColorRect")
>>>>>>> basement-office:adnan/CanvasLayer.gd
	# print(n)
	get_node("/root/RootScene/BASEMENT/ColorRect").visible = false
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var instructions_shown = false

func _on_Area_body_entered(body):
	# print("Instructions Shown")
	# print(instructions_shown)
	if body.name == "MC" and instructions_shown == false:
		# print("got here")
		instructions_shown = true
		get_node("/root/RootScene/BASEMENT/ColorRect").visible = true
		get_node("/root/RootScene/BASEMENT/ColorRect/ColorRectTimer/").start(3)
<<<<<<< HEAD:workspaces/adnan/CanvasLayer.gd
		# get_node("/root/RootScene/BASEMENT/go to vent text")
		$InstructionsBackground.visible = true

	get_node("/root/RootScene/BASEMENT/Instructions/InstructionsTimer").start(1)
=======
		get_node("/root/RootScene/BASEMENT/go to vent text")
		#$InstructionsBackground.visible = true
		#get_node("/root/RootScene/BASEMENT/Instructions/InstructionsTimer").start(1)
>>>>>>> basement-office:adnan/CanvasLayer.gd


func _on_InstructionsTimer_timeout():
	#get_parent().get_node("Instructions").visible = false
	pass
