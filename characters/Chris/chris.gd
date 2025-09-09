extends KinematicBody

var speed = 5
onready var agent = $NavigationAgent
onready var anim_tree = $AnimationTree
onready var label = get_parent().get_node("Control/Label")
var goal = true

func _ready():
	yield(get_tree().create_timer(5),"timeout")
	select_new_destination()

func _physics_process(_delta):
	var velocity = Vector3.ZERO
	var destination = agent.get_next_location()
	var direction_to_destination = destination - global_translation
	var direction = direction_to_destination.normalized()
	if direction.length_squared() > 1.0:
		direction = direction.normalized()
	safe_look_at(self, Vector3(direction.x, global_translation.y, direction.z))
	label.text = "Goal: " + str(goal)
	
	velocity = direction * speed
	
	anim_tree["parameters/conditions/idle"] = goal
	anim_tree["parameters/conditions/walk"] = !goal
	
	velocity = move_and_slide(velocity)

func select_new_destination():
	agent.set_target_location(get_parent().get_node("class" + str(int(rand_range(1,4)))).global_translation)

func safe_look_at(node : Node, target : Vector3):
	var origin : Vector3 = node.global_translation
	var v_z := (origin - target).normalized()

	# Just return if at same position
	if origin == target:
		return
	
	# Find an up vector that we can rotate around
	var up := Vector3.ZERO
	for entry in [Vector3.UP, Vector3.RIGHT, Vector3.BACK]:
		var v_x : Vector3 = entry.cross(v_z).normalized()
		if v_x.length() != 0:
			up = entry
			break

	# Look at the target
	if up != Vector3.ZERO:
		node.look_at(target, up)


func _on_NavigationAgent_navigation_finished():
	goal = !goal
	print("made it to mah spot")
	yield(get_tree().create_timer(3),"timeout")
	select_new_destination()
	goal = !goal

