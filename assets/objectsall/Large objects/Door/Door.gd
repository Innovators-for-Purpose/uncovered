extends Area

var target = 0
var path = []
var currently_colliding = false
var dialogue_player = null

func _input(event):
	if event.is_action_pressed("game_usage") and currently_colliding:
		find_and_use_dialogue()
		#print("in_area_Door")
		#print(currently_colliding)

func find_and_use_dialogue():
	dialogue_player = get_node_or_null("DialoguePlayer")
	if dialogue_player:
		if not dialogue_player.next_line():
			# print("now changing target")
			target = 0

func _on_Door_tree_exited():
	dialogue_player = get_node_or_null("DialoguePlayer")
	if dialogue_player:
		dialogue_player.reset()

func _process(_delta):
	if len(get_overlapping_bodies()) == 0:
		dialogue_player = get_node_or_null("DialoguePlayer")
		if dialogue_player:
			dialogue_player.reset()

func _on_Area_body_entered(body):
	if body.name == "MC":
		currently_colliding = true

func _on_Area_body_exited(_body):
	currently_colliding = false
	#dialogue_player.reset()

func _on_Door_body_entered(_body):
	pass
	
func _on_Door_body_exited(_body):
	pass
