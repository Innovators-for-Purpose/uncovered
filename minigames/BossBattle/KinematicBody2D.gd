extends KinematicBody2D

export (int) var speed = 900

var velocity = Vector2()
var collision
func get_input():	
	velocity = Vector2(0, 0)
	if Input.is_action_pressed("right"):
		velocity.x += 100
	if Input.is_action_pressed("left"):
		velocity.x -= 100
	if Input.is_action_pressed("up"):
		velocity.y -= 100
	if Input.is_action_pressed("down"):
		velocity.y += 100
	
	#if Input.is_action_pressed("spacebar") and is_on_floor():
	#	velocity.y = -500

	#velocity.y += 1
	

	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	
func is_on_floor():
	collision = move_and_collide(Vector2(0, 1))
	return collision

#func _on_Door_body_entered(body):
	#position.x = -36250
	#position.y = 0
