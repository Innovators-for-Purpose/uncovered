extends Node2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	print(PlayerInventory.inventory.size())
	yield(get_tree().create_timer(2),"timeout")
	get_node("PlayerGUI/Label").say("I need to escape this room!!")




