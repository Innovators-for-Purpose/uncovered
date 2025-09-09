extends Camera

var speed = 0.1

func _ready():
	pass 
func _physics_process(_delta):
	var _x = transform.origin.x
	var _y = transform.origin.y
	var _z = transform.origin.z
#	if Input.is_action_pressed("ui_faster"):
#		speed = 0.3
#	else:
#		speed = 0.1
	if Input.is_action_pressed("ui_down"):
		transform.origin.y -= speed
		pass
	if Input.is_action_pressed("ui_left"):
		transform.origin.x -= speed
		pass
	if Input.is_action_pressed("ui_right"):
		transform.origin.x += speed
		pass
	if Input.is_action_pressed("ui_up"):
		transform.origin.y += speed
		pass
#	if Input.is_action_pressed("ui_front"):
#		transform.origin.z -= speed
		pass
#	if Input.is_action_pressed("ui_back"):
#		transform.origin.z += speed
#		pass
