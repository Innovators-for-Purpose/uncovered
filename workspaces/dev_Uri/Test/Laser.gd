extends Sprite

var speed = 0

func _process(delta):
	if Input.is_key_pressed(KEY_S):
		speed = 5
	
	var velocity = Vector2.ZERO
	velocity = Vector2.UP.rotated(rotation) * speed
	position = velocity * delta
