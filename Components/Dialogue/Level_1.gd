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
		currently_colliding = true
		toggle_the_player(false)
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.is_action_just_pressed("game_usage")

func _on_Timer_timeout():
	if currently_colliding == true:
		active_dialogue = active_dialogue+1

func _physics_process(delta):
	if  active_dialogue == 0 and currently_colliding == false:
		visible = false

	elif Input.is_action_just_pressed("game_usage") and currently_colliding == true:
		active_dialogue = 18

	elif active_dialogue == 0 and currently_colliding == true:
		visible = true 



	if active_dialogue == 0:
		Lx.text = "Zach and I make our way through the doors and into the dimly lit school corridors."
		NQx.hide()
		TQx.hide()
		Px.show()
		IDx.hide()
		IEx.show()

	if active_dialogue == 1:
		Lx.text = "Welcome to our amazing school!"
		NQx.text = "Zach"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.show()

	if active_dialogue == 2:
		Lx.text = "We both look around at the worn-out school corridor before looking back at each other."
		NQx.hide()
		TQx.hide()
		Px.show()
		IDx.hide()

	if active_dialogue == 3:
		Lx.text = "OK… maybe it's not so great. But look at the bright side, at least you have me here with you."
		NQx.text = "Zach"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.show()

	if active_dialogue == 4:
		Lx.text = "I don't think there is a bright side…"
		NQx.text = "you"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.hide()

	if active_dialogue == 5:
		Lx.text = "C'mon don't be like that new kid. I'm sure you'll like it here in no time."
		NQx.text = "Zach"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.show()

	if active_dialogue == 6:
		Lx.text = "I watch as Zach nervously scans the school corridors, anticipating something."
		NQx.hide()
		TQx.hide()
		Px.show()
		IDx.hide()

	if active_dialogue == 7:
		Lx.text = "Are you looking for someone?"
		NQx.text = "you"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.hide()

	if active_dialogue == 8:
		Lx.text = "Huh? Oh.. more like avoiding someone."
		NQx.text = "Zach"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.show()

	if active_dialogue == 9:
		Lx.text = "If Mrs. Grant catches me outside of class again, I don't think I'll hear the end of it"
		NQx.text = "Zach"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.show()

	if active_dialogue == 10:
		Lx.text = "Mrs. Grant?"
		NQx.text = "you"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.hide()

	if active_dialogue == 11:
		Lx.text = "Yeah, the principal. That lady hates my guts for some reason."
		NQx.text = "Zach"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.show()

	if active_dialogue == 12:
		Lx.text = "We both turn to the sound of footsteps off into the distance."
		NQx.hide()
		TQx.hide()
		Px.show()
		IDx.hide()

	if active_dialogue == 13:
		Lx.text = "... anyways, It was nice chatting with you but I gotta blast!"
		NQx.text = "Zach"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.show()

	if active_dialogue == 14:
		Lx.text = "Wait but what about-"
		NQx.text = "you"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.hide()

	if active_dialogue == 15:
		Lx.text = "..."
		NQx.text = "you"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.hide()

	if active_dialogue == 16:
		Lx.text = "The tour,"
		NQx.text = "you"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.hide()

	if active_dialogue == 17:
		Lx.text = "Guess It's up to me to find my own classes."
		NQx.text = "you"
		TQx.show()
		NQx.show()
		Px.show()
		IDx.hide()

	if active_dialogue == 18:
		visible = false
		toggle_the_player(true)
		Lx.hide()
		NQx.hide()
		Px.hide()
		IDx.hide()
		IEx.hide()
		velocity = 10

func _on_Area_body_exited(body):
	visible = false
	currently_colliding = false

func _on_Button_pressed():
	 active_dialogue = 18
