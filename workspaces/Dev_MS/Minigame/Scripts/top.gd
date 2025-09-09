extends Sprite






func _on_Area2D_body_entered(body):
	if not body.name == "yellowdrag":
		pass
	if body.name == "yellowdrag":
		visible = true 
	if body.name == "yellowdrag":
		get_node("/root/RootScene/OFFICE/Node2D").yellowline = true
	if body.name == "yellowdrag":
		get_node("/root/RootScene/OFFICE/Node2D")._on_green_area_body_entered()
