extends Sprite

# Constants
var acceleration = 5 # Max speed = acceleration/linear friction
var angular_speed = PI
var linear_friction = 0.01
var rotational_friction = 0.01

# Game variables
var speed = 0
var leftDirection = -1
var rightDirection = 1

func _ready():
	# print("Ready")
	pass

func _process(delta):
	# If left arrow is pressed, increase left rotation
	if Input.is_action_pressed("ui_left"):
		leftDirection *= 1.05
	# If right arrow is pressed, increase right rotation
	if Input.is_action_pressed("ui_right"):
		rightDirection *= 1.05
	
	# 
	leftDirection *= 1-rotational_friction
	rightDirection *= 1-rotational_friction
	
	speed *= 1-linear_friction

	rotation += angular_speed * (rightDirection+leftDirection) * delta

	if Input.is_action_pressed("ui_select"):
		speed += acceleration
		# print(speed)
	
	var velocity = Vector2.ZERO
	velocity = Vector2.UP.rotated(rotation) * speed
	
	position += velocity * delta
	
	if Input.is_key_pressed(KEY_R):
		speed = 0
		leftDirection = -1
		rightDirection = 1
		rotation = 0
		position = Vector2(ProjectSettings.get_setting("display/window/size/width")/2,
		ProjectSettings.get_setting("display/window/size/height")/2)
		
