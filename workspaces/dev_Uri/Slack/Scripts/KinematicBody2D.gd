extends KinematicBody2D

# Speed boost
var speed_boost = 1
var space_pressed = false

# Constants
const UNIVERSAL_SPEED_BOOST = 1.005
# Move in a square
const SQUARE_LENGTH = 50
const SQUARE_SPEED = 2
# Infinite loop
const LOOP_SPEED = 6
# Back and forth
const BAF_SPEED = 2
const BAF_DISTANCE = 50

# Spin Infinitely
var first_process = false
var one_pressed = false
var one_pressed_previous = false

# Move in a square
var second_process = false
var two_pressed = false
var two_pressed_previous = false
var side_completed = 0

# Infinite loop
var third_process = false
var three_pressed = false
var three_pressed_previous = false

# Back and forth
var fourth_process = false
var four_pressed = false
var four_pressed_previous = false
var distance = 0

func _process(delta):
	# Moves the character to the other side of the screen
	# when it gets out of bounds
	if position.x > get_viewport().size.x+2:
		position.x = -2
	if position.x < -2:
		position.x = get_viewport().size.x+2

	if position.y > get_viewport().size.y+2:
		position.y = -2
	if position.y < -2:
		position.y = get_viewport().size.y+2
	
	# Resets the character to the center of the screen
	if Input.is_key_pressed(KEY_R):
		position = Vector2(get_viewport().size.x/2, get_viewport().size.y/2)
	
	# Gives a speed boost while space is pressed
	space_pressed = Input.is_key_pressed(KEY_SPACE)
	if space_pressed:
		speed_boost *= UNIVERSAL_SPEED_BOOST
	elif speed_boost > 1:
		speed_boost *= 0.99
	if speed_boost < 1:
		speed_boost = 1
	
	# Moves the character 5 steps back and forth
	four_pressed_previous = four_pressed
	four_pressed = Input.is_key_pressed(KEY_4)
	if four_pressed && !four_pressed_previous:
		fourth_process = !fourth_process
	if fourth_process:
		back_and_forth()
	
	# Moves the character from one side of the screen to the other, 
	# and then moves it back to the beginning in an infinite loop.
	three_pressed_previous = three_pressed
	three_pressed = Input.is_key_pressed(KEY_3)
	if three_pressed && !three_pressed_previous:
		third_process = !third_process
	if third_process:
		infinite_loop()
	
	# Moves character in a square
	two_pressed_previous = two_pressed
	two_pressed = Input.is_key_pressed(KEY_2)
	if two_pressed && !two_pressed_previous:
		second_process = !second_process
	if second_process:
		square()
	
	# Pressing 1 toggles the sprite from spinning infinitely
	one_pressed_previous = one_pressed
	one_pressed = Input.is_key_pressed(KEY_1)
	if one_pressed && !one_pressed_previous:
		first_process = !first_process
	if first_process:
		circle_forever(delta)

# Activates when 4 is pressed
func back_and_forth():
	var velocity = Vector2.UP.rotated(rotation) * BAF_SPEED * speed_boost
	distance += BAF_SPEED * speed_boost
	position += velocity
	if distance >= BAF_DISTANCE:
		distance = 0
		rotation += PI

# Activates when 3 is pressed
func infinite_loop():
	var velocity = Vector2.UP.rotated(rotation) * LOOP_SPEED * speed_boost
	position += velocity

# Activates when 2 is pressed
func square():
	var velocity = Vector2.UP.rotated(rotation) * SQUARE_SPEED * speed_boost
	side_completed += 1
	if side_completed == SQUARE_LENGTH:
		side_completed = 0
		rotation += PI/2
	position += velocity

# Activates when 1 is pressed
func circle_forever(delta):
	rotation += PI * delta * speed_boost

	var velocity = Vector2.ZERO
	velocity = Vector2.UP.rotated(rotation)

	position += velocity * delta
