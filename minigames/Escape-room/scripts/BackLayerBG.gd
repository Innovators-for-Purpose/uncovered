extends ParallaxLayer

func _process(_delta):
	self.position = get_local_mouse_position() * 0.02



