extends Sprite

const bulletPath = preload ('res://Bullet.tscn')

func ready():
	pass
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("Im shooting")
		shoot()
	
func shoot():
	var bullet = bulletPath.instance()
	
	get_parent().get_parent().add_child(bullet)
	# var test_node = get_node("/root/Collisionshape2D/Pipe_2")
	# print(test_node) 
	# print(bullet.position)
	bullet.position = get_node("/root/Node2D/Pipe2").global_position 
	
	
	
	
