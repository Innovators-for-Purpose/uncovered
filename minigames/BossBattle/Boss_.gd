extends KinematicBody2D

var time = 0

export (int) var speed = 100

func _physics_process(delta):
	time = time + delta
	time += delta
	# print(time)
	time = int(time)
	# every two seconds
	

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



# var velocity = 50
# func _ready():
# 	if Input.is_action_pressed("left"):
# 				velocity.x = 1
# 				$Sprite.flip_h = false

# 	if Input.is_action_pressed("down"):
# 		velocity.y += 1
