extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.


func _on_red_area_body_entered(body):	
	if not body.name == "reddrag":
		pass
	if body.name == "reddrag":
		visible = true 
	if body.name == "reddrag":
		get_node("/root/RootScene/OFFICE/Node2D").redline = true
	if body.name == "reddrag":
		get_node("/root/RootScene/OFFICE/Node2D")._on_green_area_body_entered()

func _on_red_area_body_exited(_body):
	pass
