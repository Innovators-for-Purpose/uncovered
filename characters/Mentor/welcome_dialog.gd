extends Dialogic

var count = 1
var talking = 1
var colide = 3
func _physics_process(delta):
	print(talking)
	print(colide)
	if Input.is_action_pressed("kick"):
		talking = 2
	else:
		talking = 1
	if  count == 1 and talking == 2 and colide == 4:
		count = 2
		get_node("/root/RootScene/Node2D/Enviroment/MC").immobile = true
		var dialog = Dialogic.start('hallway')
		dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(dialog)
		
func _on_Area_body_entered(body):
	
	if body.name == "MC" and count == 1:
		
		get_node("/root/RootScene/Node2D/Enviroment/MC/CanvasLayer/Popup").visible = true
		colide = 4

func dialog_listener(string):
	match string:
		"end_timeline":
			# do something
			get_node("/root/RootScene/Node2D/Enviroment/MC").immobile = false
			count = 2

#func _physics_process(delta):
#	print(count)






func _on_Area_body_exited(body):
	if body.name == "MC":
		get_node("/root/RootScene/Node2D/Enviroment/MC/CanvasLayer/Popup").visible = false
	colide = 3
