extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass# Replace with function body.
	"""
func _process(delta):
	framecount += 1
	if framecount%60 == 0:
		seconds += 1
		# print(str(seconds))
	"""
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index ==BUTTON_LEFT and event.pressed == true:
			$CSGSphere.visible = false
			# print("I am here sir i have done it ")
			get_node("/root/RootScene/Door3/AnimationPlayer").play("open")
			get_node("/root/RootScene/Timer").start(300000)


func _on_Timer_timeout():
	# print("transition 3")
	return get_tree().change_scene("res://scenes/Hall/CreationScene.tscn")

#switch to a different game
