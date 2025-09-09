extends Sprite




func _on_Blue_area_body_entered(body):
	if not body.name == "bluedrag":
		pass
	if body.name == "bluedrag":
		visible = true 
	if body.name == "bluedrag":
		get_node("/root/RootScene/OFFICE/Node2D").blueline = true
	if body.name == "bluedrag":
		get_node("/root/RootScene/OFFICE/Node2D")._on_green_area_body_entered()
