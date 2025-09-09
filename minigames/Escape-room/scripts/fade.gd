extends ColorRect

onready var front = get_node("/root/Node2D/Front")
onready var backbtn = get_node("/root/Node2D/PlayerGUI/BackBtn")
onready var turnbtn = get_node("/root/Node2D/PlayerGUI/TurnBtn")
func _ready():
	$AnimationPlayer.play("begining")
	yield($AnimationPlayer,"animation_finished")
	hide()

func transit(name):
	var Door = get_node("/root/Node2D/Door")
	var computer = get_node("/root/Node2D/Computer")
	var tablet = get_node("/root/Node2D/Tablet")
	var gb = get_node("/root/Node2D/GearBox")
	var Cabinets = get_node("/root/Node2D/Cabenits-p2")
#	var back = get_node("/root/Node2D/Back")
	var background = get_node("/root/Node2D/Door/ParallaxLayer/Background")
	self.show()
	$AnimationPlayer.play("fade")
	yield($AnimationPlayer,"animation_finished")
	if name == "door_finished":
		background.texture = load("res://minigames/Escape-room/Escape-room_res/Txtrs/close ups/puzzle 2/door_open.png")
	elif name == "Front":
		Cabinets.hide()
		Door.hide()
		computer.hide()
		tablet.hide()
		gb.hide()
		backbtn.hide()
	else:
		get_node("/root/Node2D/"+name).visible = !get_node("/root/Node2D/"+name).visible
		get_node("/root/Node2D/Front").hide()

	$AnimationPlayer.play_backwards("fade")
	yield($AnimationPlayer,"animation_finished")
	self.hide()
	

func _on_CabinetButton_pressed():
	transit("Cabenits-p2")
	yield($AnimationPlayer,"animation_finished")
	turnbtn.hide()
	backbtn.show()
	front.hide()
	

func _exit_door():
	transit("door_finished")
	yield($AnimationPlayer,"animation_finished")
	get_node("/root/Node2D/PlayerGUI").hide()


func _on_DoorLock_pressed():
	transit("Door")
	yield($AnimationPlayer,"animation_finished")
	turnbtn.hide()
	backbtn.show()
	front.hide()

func _on_ComputerButton_pressed():
	transit("Computer")
	yield($AnimationPlayer,"animation_finished")
	turnbtn.hide()
	backbtn.show()
	front.hide()



func _on_TabletButton_pressed():
	transit("Tablet")
	yield($AnimationPlayer,"animation_finished")
	turnbtn.hide()
	backbtn.show()
	front.hide()



func _on_Button_pressed():
	transit("Front")
	yield($AnimationPlayer,"animation_finished")
	turnbtn.show()
	front.show()

func _on_GearBox_pressed():
	transit("GearBox")
	yield($AnimationPlayer,"animation_finished")
	turnbtn.hide()
	backbtn.show()
	front.hide()

func _on_TurnButton_pressed():
	transit("Back")
	get_parent().get_node("TurnBtn").disabled = !get_parent().get_node("TurnBtn").disabled
	yield($AnimationPlayer,"animation_finished")
	get_parent().get_node("TurnBtn").disabled = !get_parent().get_node("TurnBtn").disabled
	front.show()
