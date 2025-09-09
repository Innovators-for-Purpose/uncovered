extends KinematicBody2D

var dragReady = false
var myClickPos 
var myDistance = Vector2(0,0)
var completed = false

func _physics_process(_delta):
	if Input.is_action_pressed("click") and dragReady:
		myClickPos = get_global_mouse_position()
		#myDistance = get_position()- myClickPos
		#print(myDistance)
	if Input.is_action_pressed("click") and dragReady and not completed:
		set_position(get_global_mouse_position())

func _on_KinematicBody2D_mouse_entered():
	get_node("../..").yellowdrag = true
	if not( get_node("../..").bluedrag or get_node("../..").greendrag or get_node("../..").reddrag):
		dragReady = true

func _on_KinematicBody2D_mouse_exited():
	dragReady = false
	get_node("../..").yellowdrag = false

func _on_yellow_area_body_entered(body):
	# This makes the yellow dot drop when in correct area
	if Input.is_action_pressed("click") and body.name == "yellowdrag":
		completed = true
		dragReady = false
