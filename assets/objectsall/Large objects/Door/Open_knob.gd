extends Spatial

func _ready():
	pass
	"""
func _process(delta):
	framecount += 1
	if framecount%60 == 0:
		seconds += 1
		# print(str(seconds))
	"""

func _on_Area_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index ==BUTTON_LEFT and event.pressed == true:
			$CSGSphere.visible = false
			# print("I am here sir i have done it ")
			get_node("/root/RootScene/Door I/AnimationPlayer").play("open")
			get_node("/root/RootScene/Timer").start(300000)


func _on_Timer_timeout():
	# print("transition 3")
	pass


func _on_Area_body_entered(_body):
	pass # Replace with function body.
