extends Button

onready var fade = get_node("/root/Node2D/PlayerGUI/fade")

func _ready():
	var _doorlock = self.connect("pressed",fade,"_on_DoorLock_pressed")

func _on_DoorLock_pressed():
	pass
