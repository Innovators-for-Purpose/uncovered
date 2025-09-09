extends Area
var currently_colliding = false
var dialogue_player = null
var count = 0

func toggle_the_player(on):
	var player = get_tree().get_root().find_node("MC", true, false)
	if player:
		player.set_active(on)

func _input(event):
	if event.is_action_pressed("game_usage") and currently_colliding:
		count = count+1

func _on_Area_body_entered(body):
	if body.name == "MC":
		currently_colliding = true

func _on_Area_body_exited(_body):
	currently_colliding = false

func _on_Timer_timeout():
	count = count+1
	if count == 3:
		toggle_the_player(true)
