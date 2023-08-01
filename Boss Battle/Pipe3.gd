extends Sprite

const bulletPath = preload ('res://Boss Battle/Bullet.tscn')
onready var player = get_node("/root/Node2D/Node2D/MC_body")
func ready():
	pass

func _process(delta):
		if Input.is_action_just_pressed("ui_accept"):
			print("Im shooting")
			shoot()
	
func shoot():
	var bullet = bulletPath.instance()
	
	get_parent().get_parent().add_child(bullet)
	bullet.position = get_node("/root/Node2D/Pipe3_Body/Pipe3").global_position 

