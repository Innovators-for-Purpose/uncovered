extends AnimationPlayer


func _ready():
	if Input.is_action_pressed('ui_destruction'):
		get_node("$AnimationPlayer").play("floorcube000")
