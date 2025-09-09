extends KinematicBody
var gravity = Vector3.DOWN * 15
var walkspeed = 5
var speed
var jump_speed = 10
var spin = 0.05
var velocity = Vector3.ZERO
#var jump = false
var sprintspeed = 20
var flag = 1

func get_input():
	if Input.is_action_pressed("shift"):
		speed = sprintspeed
		gravity = Vector3.DOWN * 75
	else:
		speed = walkspeed
		gravity = Vector3.DOWN * 75 
	var vy = velocity.y
	velocity = Vector3()
	if Input.is_action_pressed("move_forward"):
		velocity += -transform.basis.z * speed
	if Input.is_action_pressed("move_back"):
		velocity += transform.basis.z * speed
	if Input.is_action_pressed("move_right"):
		velocity += transform.basis.x * speed
	if Input.is_action_pressed("move_left"):
		velocity += -transform.basis.x * speed
	if Input.is_action_pressed("mouse_toggle") and flag:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		flag = 0
	elif Input.is_action_pressed("mouse_toggle"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		# Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	velocity.y = vy
	
	#jump = false
	#if is_on_floor() and Input.is_action_just_pressed("jump"):
		#jump = true
func _physics_process(delta):
	velocity += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector3.UP)
	#if jump and is_on_floor():
		#velocity.y = jump_speed

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if event.relative.x > 0:
			rotate_y(-lerp(0, spin, event.relative.x/50))
		if event.relative.x < 0:
			rotate_y(-lerp(0, spin, event.relative.x/50))
		#if abs(event.relative.y) > 0:
			#rotate_x(-lerp(0, spin, event.relative.y/50))
var initial_position
func _ready():
	initial_position = get_global_transform().origin
func _process(_delta):
	if Input.is_action_just_pressed("reset"):
		set_translation(initial_position)
		speed = 2.5
