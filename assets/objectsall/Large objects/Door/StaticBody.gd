extends Area

var target = 0
var path = []

var dialogue_player = null

func _input(event):
	if event.is_action_pressed("game_usage") and len(get_overlapping_bodies()) > 1:
		find_and_use_dialogue()
func find_and_use_dialogue():
	dialogue_player = get_node_or_null("Dialogueplayer")
	if dialogue_player:
		if not dialogue_player.next_line():
			# print("now changing target")
			target = 1
			
func _on_Door_body_exited(_body):
	dialogue_player = get_node_or_null("Dialogueplayer")
	if dialogue_player:
		dialogue_player.reset()
func _process(_delta):
	if len(get_overlapping_bodies()) == 0:
		dialogue_player = get_node_or_null("Dialogueplayer")
		if dialogue_player:
			dialogue_player.reset()
