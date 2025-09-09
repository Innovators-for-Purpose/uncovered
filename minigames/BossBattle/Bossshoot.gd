extends Sprite

const bulletPath = preload ('res://minigames/BossBattle/Bullet.tscn')

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
	#Node.get_node("Bullet").global_position 
	
	#NEEDS TO GET FIXED
	
	
	
	
