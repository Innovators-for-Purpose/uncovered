extends Button

onready var fade = get_node("/root/Node2D/PlayerGUI/fade")

func _ready():
	var _pc = connect("pressed",fade,"_on_ComputerButton_pressed")

func _on_Computer_pressed():
	return
