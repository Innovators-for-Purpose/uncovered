extends Area

var target = 0
var velocity = Vector3(0,0,0)
var speed = 0.2
var path = []
var currently_colliding = false
var dialogue_player = null
var count = 0
var PathI = 0
func _input(event):
	if event.is_action_pressed("game_usage") and currently_colliding:
		#print("functions")
		pass

func _on_Timer_timeout():
	count = count+1	

	if Input.is_action_just_pressed("game_usage") and currently_colliding == true:
		count = count+1

	if Input.is_action_just_pressed("game_usageI") and currently_colliding == true:
		count = 10

	if count >= 10:
		toggle_the_player(true)

func toggle_the_player(on):
	var player = get_tree().get_root().find_node("MC", true, false)
	if player:
		player.set_active(on)

func _ready():
	visible = true

func _physics_process(_delta):
	if count >= 10 and path.size() == 0:
		path = [Vector3(-25.382,12.968,-1.5), Vector3(-45,12.968,-1.5), Vector3(-45,12.968,-10)]
	if path.size() > 0:
		PathI = 0
		velocity = Vector3(path[0].x - transform.origin.x, path[0].y - transform.origin.y, path[0].z - transform.origin.z)
		var distance =  velocity.length()
		#print(distance)
		if distance <= speed:
			target = 0 
			path = path.slice(1,path.size())
			velocity = Vector3(0,0,0)
		else:
			velocity = velocity.normalized() * speed
	transform.origin += velocity



