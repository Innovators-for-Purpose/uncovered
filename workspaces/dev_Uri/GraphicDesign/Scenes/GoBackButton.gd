extends Button


func click():
	get_node("/root/CreationScene").visible = false
	$Timer.start() # starts timer

