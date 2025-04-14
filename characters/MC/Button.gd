extends Button
var count = 1

func _toggled(button_pressed):
	
	if count == 1:
#		get("res://.import/inventorybackpackclosed.png-b0dc5bbe88c804f8e074d2d1de39be25.stex")
		rect_size.x= 57
		rect_size.y= 62
		count = 2
	if count == 2:
		rect_size.x = 115
		rect_size.y = 124
		
