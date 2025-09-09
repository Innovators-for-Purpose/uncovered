extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# print($NinePatchRect)
	$InstructionsBackground.visible = false
	var n = get_node("/root/RootScene/BASEMENT/ColorRect")
	# print(n)
	get_node("/root/RootScene/BASEMENT/ColorRect").visible = false
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	if body.name == "MC":
		get_node("/root/RootScene/BASEMENT/ColorRect").visible = true
		get_node("/root/RootScene/BASEMENT/ColorRect/ColorRectTimer/").start(3)
		$InstructionsBackground.visible = true

	get_node("/root/RootScene/BASEMENT/Instructions/InstructionsTimer").start(1)


func _on_InstructionsTimer_timeout():
	get_parent().get_node("Instructions").visible = false
