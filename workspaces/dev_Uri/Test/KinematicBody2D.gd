extends KinematicBody2D

var speed = 400
var angular_speed = PI


func _ready():
	# print("Ready")
	pass

func _process(delta):
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

func _unhandled_input(event):
	pass
