extends Button

onready var fade = get_node("/root/Node2D/PlayerGUI/fade")

func _ready():
	var _cabenit = connect("pressed",fade,"_on_GearBox_pressed")

func _on_GearBox_pressed():
	pass
