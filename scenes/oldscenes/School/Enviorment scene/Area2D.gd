extends KinematicBody2D


export (int) var speed = 200

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('Right'):
		velocity.x += speed
	if Input.is_action_pressed('Left'):
		velocity.x -= speed
	if Input.is_action_pressed('Down'):
		velocity.y += speed
	if Input.is_action_pressed('Up'):
		velocity.y -= speed
