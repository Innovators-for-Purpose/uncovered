extends Node2D

const SlotClass = preload("res://minigames/Escape-room/scripts/Slot.gd")
onready var keyhole = $GridContainer
onready var slots = keyhole.get_children()


func _ready():
#	self.scale = Vector2(0.13,0.13)
	$AnimationPlayer.play("RESET")
	for i in range(slots.size()):
		slots[i].connect("gui_input", self, "slot_gui_input", [slots[i]])
		slots[i].slot_index = i

func initinalize_keyhole():
	for i in range(slots.size()):
		if PlayerInventory.keyhole.has(i):
			slots[i].initialize_item(PlayerInventory.keyhole[i][0])

func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			if get_node("/root/Node2D/PlayerGUI/Inv").holding_item != null:
				if !slot.Item:
					left_click_empty_slot(slot)
					print(slot.Item.item_name)
					if slot.Item.item_name == "Door Key":
						find_parent("ParallaxLayer").DoorKey = true
						$GridContainer.queue_free()
						$AnimationPlayer.play("Key Unlock")
					else:
						print("Wrong Key")
						not_holding(slot)

func left_click_empty_slot(slot: SlotClass):
#	PlayerInventory.add_item_to_empty_slot(find_parent("Inv").holding_item,slot)
	slot.putIntoSlot(get_node("/root/Node2D/PlayerGUI/Inv").holding_item)
	get_node("/root/Node2D/PlayerGUI/Inv").holding_item = null
	
func left_click_different_item(event: InputEvent, slot: SlotClass):
#	PlayerInventory.remove_item(slot)
#	PlayerInventory.add_item_to_empty_slot(find_parent("Inv").holding_item,slot)
	var temp_item = slot.Item
	slot.pickFromSlot()
	temp_item.global_position = event.global_position
	slot.putIntoSlot(get_node("/root/Node2D/PlayerGUI/Inv").holding_item)
	get_node("/root/Node2D/PlayerGUI/Inv").holding_item = temp_item

func not_holding(slot:SlotClass):
#	PlayerInventory.remove_item(slot)
	get_node("/root/Node2D/PlayerGUI/Inv").holding_item = slot.Item
	slot.pickFromSlot()
	get_node("/root/Node2D/PlayerGUI/Inv").holding_item.global_position = get_global_mouse_position()
	
