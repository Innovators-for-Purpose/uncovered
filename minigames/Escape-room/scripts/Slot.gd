extends Panel


var ItemClass = preload("res://minigames/Escape-room/scenes/Item.tscn")
var Item = null
var slot_index
func _ready():
	pass
#	if randi() % 2 == 0:
#		Item = ItemClass.instance()
#		add_child(Item)

func pickFromSlot():
	remove_child(Item)
	var inventoryNode = get_node("/root/Node2D/PlayerGUI/Inv")
	inventoryNode.add_child(Item)
	Item = null

func putIntoSlot(new_item):
	Item = new_item
	Item.position = Vector2(0,0)
	var inventoryNode = get_node("/root/Node2D/PlayerGUI/Inv")
	inventoryNode.remove_child(Item)
	add_child(Item)
	
func initialize_item(item_name):
	if Item == null:
		Item = ItemClass.instance()
		add_child(Item)
		Item.set_item(item_name)
	else:
		Item.set_item(item_name)
	
