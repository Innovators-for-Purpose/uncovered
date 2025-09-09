extends ParallaxBackground

export var isback = false

func _on_Button_pressed():
	self.visible = !self.visible
	isback = !isback
	var front = get_node("/root/Node2D/Front")
	front.visible = !front.visible
