extends Area

var target = 0
var velocity = Vector3(0,0,0)
var speed = 0.2
var path = []
var currently_colliding = false
var dialogue_player = null

func _input(event):
	if event.is_action_pressed("game_usage") and currently_colliding:
		find_and_use_dialogue()
		#print("in_area_bulletin_board")
		#print(currently_colliding)
func find_and_use_dialogue():
	dialogue_player = get_node_or_null("DialoguePlayer")
	if dialogue_player:
		if not dialogue_player.next_line():
			# print("now changing target")
			target = 1
			


func _on_Bulletin_Board_body_exited(_body):
	dialogue_player = get_node_or_null("DialoguePlayer")
	if dialogue_player:
		dialogue_player.reset()
func _process(_delta):
	if len(get_overlapping_bodies()) == 0:
		dialogue_player = get_node_or_null("DialoguePlayer")
		if dialogue_player:
			dialogue_player.reset()

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

func _on_Area_body_exited(_body):
	currently_colliding = false
