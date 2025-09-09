extends Node2D

# VIDEO USED ||| https://www.youtube.com/watch?v=FHYb63ppHmk&list=PLY1jY0hbmKxBvcEHa0k5Aw8_MKoB6jrRU |||


const SlotClass = preload("res://minigames/Escape-room/scripts/Slot.gd")
onready var inventory_slots = $GridContainer


# Called when the node enters the scene tree for the first time.
func _ready():
#	self.scale = Vector2(0.13,0.13)
	var slots = inventory_slots.get_children()
	for i in range(slots.size()):
#		slots[i].connect("gui_input", self, "slot_gui_input", [slots[i]])
		slots[i].slot_index = i
	for inv_slot in inventory_slots.get_children():
		inv_slot.connect("gui_input", self, "slot_gui_input",[inv_slot])

func initinalize_Inventory():
	var slots = inventory_slots.get_children()
	for i in range(slots.size()):
		if PlayerInventory.inventory.has(i):
			slots[i].initialize_item(PlayerInventory.inventory[i][0])

func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			if find_parent("Inv").holding_item != null:
				if !slot.Item:
					left_click_empty_slot(slot)
				else:
					if find_parent("Inv").holding_item.item_name != slot.item.item_name:
						left_click_different_item(event, slot)


			elif slot.Item:
				not_holding(slot)




func left_click_empty_slot(slot: SlotClass):
	PlayerInventory.add_item_to_empty_slot(find_parent("Inv").holding_item,slot)
	slot.putIntoSlot(find_parent("Inv").holding_item)
	find_parent("Inv").holding_item = null
	
func left_click_different_item(event: InputEvent, slot: SlotClass):
	PlayerInventory.remove_item(slot)
	PlayerInventory.add_item_to_empty_slot(find_parent("Inv").holding_item,slot)
	var temp_item = slot.Item
	slot.pickFromSlot()
	temp_item.global_position = event.global_position
	slot.putIntoSlot(find_parent("Inv").holding_item)
	find_parent("Inv").holding_item = temp_item

func not_holding(slot:SlotClass):
	PlayerInventory.remove_item(slot)
	find_parent("Inv").holding_item = slot.Item
	slot.pickFromSlot()
	find_parent("Inv").holding_item.global_position = get_global_mouse_position()



func _input(_event):
	if find_parent("Inv").holding_item:
		find_parent("Inv").holding_item.global_position = get_global_mouse_position()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
