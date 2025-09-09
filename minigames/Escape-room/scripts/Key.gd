extends Button

var item_name

signal emit

func _ready():
	item_name = "Door Key"
	var _emit = connect("emit",get_node("/root/Node2D/PlayerGUI/Inv"),"_on_Key_emit")


	

func _on_Key_pressed():
	PlayerInventory.add_item(item_name)
	emit_signal("emit")
	get_node("/root/Node2D/GearBox/ParallaxLayer/Sprite").texture = load("res://minigames/Escape-room/Escape-room_res/Txtrs/close ups/puzzle 4/open_panel_no_key.png")
	queue_free()
