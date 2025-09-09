extends Node

const SlotClass = preload("res://minigames/Escape-room/scripts/Slot.gd")
const ItemClass = preload("res://minigames/Escape-room/scripts/Item.gd")
const NUM_INVENTORY_SLOTS = 9

var inventory = {
	
}
var slot = {
	
}
func add_item(item_name):
	for i in range(NUM_INVENTORY_SLOTS):
		if inventory.has(i) == false:
			inventory[i] = [item_name]
			update_slot_visual(i, inventory[i][0])
			return

# warning-ignore:shadowed_variable
func add_item_to_empty_slot(item:ItemClass, slot:SlotClass):
	inventory[slot.slot_index] = [item.item_name]

func update_slot_visual(slot_index, item_name):
# warning-ignore:shadowed_variable
	var slot = get_tree().root.get_node("/root/Node2D/PlayerGUI/Inv/Inventory/GridContainer/Panel" + str(slot_index + 1))
	if slot.Item != null:
		slot.Item.set_item(item_name)
	else:
		slot.initialize_item(item_name)



# warning-ignore:shadowed_variable
func remove_item(slot:SlotClass):
	inventory.erase(slot.slot_index)
