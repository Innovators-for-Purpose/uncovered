extends Timer

var currently_colliding = false

func _on_Area_body_entered(body):
	if body.name == "MC":
		currently_colliding = true

	if currently_colliding == true:
		start()
		if Input.is_action_just_pressed("game_usage") and currently_colliding == true:
			count = count+1
		elif Input.is_action_just_pressed("game_usageI") and currently_colliding == true:
			count = 6

var count = 1

func _on_WelcomeTimer_timeout():
	count = count+1
	#print("count",count)
	if count == 6:
		stop()

func _on_Area_body_exited(body):
	currently_colliding = false

	if currently_colliding == false:
		#print("workingII")
		stop()

func _physics_process(delta):
	if Input.is_action_just_pressed("game_usage") and currently_colliding == true:
		count = count+1
	if Input.is_action_just_pressed("game_usageI") and currently_colliding == true:
		count = 6

func _on_Button_pressed():
	count = 6

func _on_Button2_pressed():
	count = count+1
