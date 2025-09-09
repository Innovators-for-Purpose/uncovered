extends Button

onready var fade = get_node("/root/Node2D/PlayerGUI/fade")

func _ready():
	var _tablet = self.connect("pressed",fade,"_on_TabletButton_pressed")


func _on_TabletButton_pressed():
	return
