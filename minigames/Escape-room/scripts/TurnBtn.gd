extends Button

onready var fade = get_node("/root/Node2D/PlayerGUI/fade")
onready var back = get_node("/root/Node2D/Back")
onready var front = get_node("/root/Node2D/Front")

func _ready():
	var _turn = connect("pressed",fade,"_on_TurnButton_pressed")
#	hide()

#func _process(_delta):
#	if front.visible == false or back.visible == false:
#		hide()
#	else:
#		show()
