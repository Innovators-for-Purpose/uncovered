extends ParallaxLayer

export var slide_code = ["Star","Square","Circle","Heart"]

export var current = []

onready var cdid = get_node("/root/Node2D/Computer/ParallaxLayer").cdid

var answers = {1 : ["Heart", "Star", "Square", "Circle"], 
2: ["Square", "Circle", "Heart", "Star"],        #<--- Can you keep it a secrect?
3 : ["Star", "Circle", "Square", "Heart"]
} 
var IsCodeRight = false
export var DoorKey = false
signal fade

func _ready():
	print(get_node("/root/Node2D/Computer/ParallaxLayer").cdid)
	var _complete = connect("fade",get_node("/root/Node2D/PlayerGUI/fade"),"_exit_door")
	print(answers)

func _process(_delta):
	cdid = get_node("/root/Node2D/Computer/ParallaxLayer").cdid
	self.position = get_local_mouse_position() * 0.02
	if current.size() == 4:
		IsCodeRight = true
#		print(current)
		if (current[0] != answers[cdid][0]):
			IsCodeRight = false
		if (current[1] != answers[cdid][1]):
			IsCodeRight = false
		if (current[2] != answers[cdid][2]):
			IsCodeRight = false
		if (current[3] != answers[cdid][3]):
			IsCodeRight = false
#		print(IsCodeRight)


func _on_Doorhndle_pressed():
	if IsCodeRight == true and DoorKey == true:
		emit_signal("fade") #<-- If the Key is inserted and
		print("Access Granted!") #and the code is correct they can leave.
		$Doorhndle.hide()
		$Keyhole.hide()
		$Button1.hide()
		$Button2.hide()
		$Button3.hide()
		$Button4.hide()
		yield(get_tree().create_timer(15), "timeout")
		var dialog = Dialogic.start('demo')
		dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(dialog)
#		$Background.texture = load("res://minigames/Escape-room/Escape-room_res/Txtrs/close ups/puzzle 2/door_open.png")

	elif IsCodeRight == true:
		get_node("/root/Node2D/PlayerGUI/Label").say("Still need a key!")
		$Background.texture = load("res://minigames/Escape-room/Escape-room_res/Txtrs/close ups/puzzle 2/correct lock.png")
		$Button1.hide()
		$Button2.hide()
		$Button3.hide()
		$Button4.hide()
	elif DoorKey == true:
		get_node("/root/Node2D/PlayerGUI/Label").say("What do the shapes mean?")
	else:
		get_node("/root/Node2D/PlayerGUI/Label").say("It's  locked!")
