extends Control
onready var Px = $Panel
onready var Lx = $Panel/Label
onready var IDx = $Panel/NinePatchRect
onready var TQx = $Panel/NinePatchRect2
onready var NQx = $Panel/NinePatchRect2/Label
onready var IQx = $Panel/Backtext
onready var IEx = $Panel/BackBoard

var currently_colliding = false
var active_dialogue = 0
var move = true
var player = true

func _ready():
	pass

func move_and_slide():
	pass

func toggle_the_player(on):
	var player = get_tree().get_root().find_node("MC", true, false)
	if player:
		player.set_active(on)

func _on_Area_body_entered(body):
	if body.name == "MC":
		body.immobile = true
		#print("body.immobile")
		#print(body.immobile)
		currently_colliding = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.is_action_just_pressed("game_usage")
		#print("WorkingIL")
		var player = get_node("/root/RootScene/Node2D/Enviroment/MC")
		player.immobile = true

func _on_Timer_timeout():
	if currently_colliding == true:
		active_dialogue = active_dialogue+1


func _physics_process(delta):
	if  active_dialogue == 0 and currently_colliding == false:
		visible = false

	elif Input.is_action_just_pressed("game_usage") and currently_colliding == true:
		active_dialogue = active_dialogue+1

	elif Input.is_action_just_pressed("game_usageI") and currently_colliding == true:
		active_dialogue = 6

	elif active_dialogue == 0 and currently_colliding == true:
		visible = true 

	if active_dialogue == 0:
		Lx.text = "What are you?"
		NQx.text = "you"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.hide()
		IEx.show()

	if active_dialogue == 1:
		Lx.text = "ya, a stttudent umm what?"
		NQx.text = "Student"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.show()

	if active_dialogue == 2:
		Lx.text = "Whatever, I don’t care anyway"
		NQx.text = "You"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.hide()

	if active_dialogue == 3:
		Lx.text = "Uh? Right your the new …."
		NQx.text = "Student"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.hide()

	if active_dialogue == 4:
		Lx.text = "Ya, sure, bye"
		NQx.text = "You"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.hide()

	if active_dialogue == 5:
		Lx.text = "and leave."
		NQx.text = "You"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.hide()

	if active_dialogue == 6:
		visible = false
		Lx.hide()
		NQx.hide()
		Px.hide()
		IDx.hide()
		IEx.hide()

func _on_Area_body_exited(body):
	visible = false
	currently_colliding = false

func _on_Button_pressed():
	 active_dialogue = 6
	
func _on_Button2_pressed():
	 active_dialogue = active_dialogue+1

func _on_Student_area_entered(area):
	#print("Working")
	pass

func _on_Student_area_exited(area):
	pass # Replace with function body.
