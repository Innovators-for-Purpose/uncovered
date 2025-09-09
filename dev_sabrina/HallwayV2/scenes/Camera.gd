extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 0.1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var x = transform.origin.x
	var y = transform.origin.y
	var z = transform.origin.z
	if Input.is_action_pressed("ui_faster"):
		speed = 0.3
	else:
		speed = 0.1
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
	if Input.is_action_pressed("ui_front"):
		transform.origin.z -= speed
		pass
	if Input.is_action_pressed("ui_back"):
		transform.origin.z += speed
		pass
	
