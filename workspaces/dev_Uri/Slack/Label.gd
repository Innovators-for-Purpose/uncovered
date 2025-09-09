extends Label

func _process(delta):
	text = "Speed Boost (Space): "+str(get_node("/root/Player").speed_boost)
