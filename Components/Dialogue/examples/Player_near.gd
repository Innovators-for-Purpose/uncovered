extends Area2D

var button 
var action 
var player_colliding

func setup(b, a):
	button = b 
	action = a

func _on_Mentor_body_entered(_body):
	player_colliding = (true)
func _on_Mentor_body_exited(_body):
	player_colliding = (false)
func _input(event):
	if event.is_action_pressed("game_usage") & player_colliding:
		call(action)
