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
var velocity = 10

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
		currently_colliding = true
		toggle_the_player(false)
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		#print("WorkingXL")

func _on_Timer_timeout():
	if currently_colliding == true:
		active_dialogue = active_dialogue+1

func _physics_process(_delta):
	if  active_dialogue == 0 and currently_colliding == false:
		visible = false

	elif Input.is_action_just_pressed("game_usage") and currently_colliding == true:
		active_dialogue = active_dialogue+1

	elif Input.is_action_just_pressed("game_usage") and currently_colliding == true:
		active_dialogue = 10

	elif active_dialogue == 0 and currently_colliding == true:
		visible = true 

	if active_dialogue == 0:
		Lx.text = "I hate it here. It's so boring!"
		NQx.text = "You"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.hide()
		IEx.show()

	if active_dialogue == 1:
		Lx.text = "You've been saying that all morning, since mom woke you up."
		NQx.text = "MentorI"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.show()

	if active_dialogue == 2:
		Lx.text = "I promise it won't be that bad."
		NQx.text = "MentorI"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.hide()

	if active_dialogue == 3:
		Lx.text = "Even so, school IS NOT FOR ME!!"
		NQx.text = "You"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.hide()

	if active_dialogue == 4:
		Lx.text = "I'm tooooo OLD FOR THIS!!!!"
		NQx.text = "You"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.hide()

	if active_dialogue == 5:
		Lx.text = "If you're too old for this, than what am I?"
		NQx.text = "MentorI"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.show()

	if active_dialogue == 6:
		Lx.text = "Besides, why are you complaining?"
		NQx.text = "MentorI"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.show()

	if active_dialogue == 7:
		Lx.text = "you just got here."
		NQx.text = "MentorI"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.show()

	if active_dialogue == 8:
		Lx.text = "Let your elderly brother give you a little tour."
		NQx.text = "MentorI"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.show()

	if active_dialogue == 9:
		Lx.text = "I know this place like the back of my hand."
		NQx.text = "MentorI"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.show()

	if active_dialogue == 10:
		visible = false
		toggle_the_player(true)
		Lx.hide()
		NQx.hide()
		Px.hide()
		IDx.hide()
		IEx.hide()
		velocity = 10
		var player = get_node("/root/RootScene/Node2D/Enviroment/MC")
		player.immobile = false

func _on_Area_body_exited(body):
	visible = false
	currently_colliding = false
	if body.name == "MC":
		body.immobile = false

func _on_Button_pressed():
	 active_dialogue = 10

func _on_Button2_pressed():
	 active_dialogue = active_dialogue+1
