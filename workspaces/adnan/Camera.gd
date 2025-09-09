extends Camera

export (float) var speed = 0.1

var time = 0
var x_movement = 0;
var z_movement = 0;

func get_input():
	x_movement = 0;
	z_movement = 0;
	if Input.is_action_pressed("ui_right"):
		x_movement += 1 * speed
	if Input.is_action_pressed("ui_left"):
		x_movement -= 1 * speed
	if Input.is_action_pressed("ui_down"):
		z_movement += 1 * speed
	if Input.is_action_pressed("ui_up"):
		z_movement -= 1 * speed

func _physics_process(delta):
	time += delta
	get_input()
	
	var position = global_translation
	#print(position)
	position.x = position.x + x_movement
	position.z = position.z + z_movement
	#print(position)
	#print("")
	
	set_global_translation(position)
