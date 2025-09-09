extends Label



func _paused_pressed():
	if get_tree().paused == true:
		show()
	else:
		hide()
