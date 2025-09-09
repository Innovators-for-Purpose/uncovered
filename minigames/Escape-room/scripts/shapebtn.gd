extends Sprite

var frame_cnt = 0


func _on_Button2_pressed():
	var frame1 = get_node("/root/Node2D/Door/ParallaxLayer/Button1/Button").get_frame() #<--- Get the Frame count
	var frame2 = get_node("/root/Node2D/Door/ParallaxLayer/Button2/Button").get_frame() #    from each Button Sprite.
	var frame3 = get_node("/root/Node2D/Door/ParallaxLayer/Button3/Button").get_frame()
	var frame4 = get_node("/root/Node2D/Door/ParallaxLayer/Button4/Button").get_frame()
	
	if get_parent().name == "Button1": #<--- Seperates buttons to add one frame
		frame1 += 1
		if frame1 >= 4:
			frame1 = 0                    #     depending on the button's name.
	if get_parent().name == "Button2":
		frame2 += 1
		if frame2 >= 4:
			frame2 = 0
	if get_parent().name == "Button3":
		frame3 += 1
		if frame3 >= 4:
			frame3 = 0
	if get_parent().name == "Button4":
		frame4 += 1
		if frame4 >=4:
			frame4 = 0
	
	var slide_code = get_node("/root/Node2D/Door/ParallaxLayer").slide_code
	get_node("/root/Node2D/Door/ParallaxLayer").current = [    #<--- Is put into new map to detect the current code
		slide_code[frame1], #     In comparision to new one
		slide_code[frame2],
		slide_code[frame3],
		slide_code[frame4]
	]
#	print(get_node("/root/Node2D/Door/ParallaxLayer").current)
	frame_cnt += 1
	if frame_cnt >= 4:
		frame_cnt = 0
	self.frame = frame_cnt
