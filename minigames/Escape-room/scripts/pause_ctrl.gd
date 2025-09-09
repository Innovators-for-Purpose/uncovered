extends Node

func _input(event: InputEvent):
	if OS.is_debug_build() && event.is_action_pressed("Debug_acquire_Door_Key") && PlayerInventory.inventory.size() == 0:
		PlayerInventory.add_item("Door Key")
	if event.is_action_pressed("pause"):
		if get_tree().paused == false:
			get_parent().pause_mode = Node.PAUSE_MODE_INHERIT
			get_tree().paused = !get_tree().paused
		else:
			get_parent().pause_mode = Node.PAUSE_MODE_PROCESS
			get_tree().paused = !get_tree().paused
