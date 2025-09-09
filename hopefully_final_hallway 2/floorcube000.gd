extends MeshInstance


func _ready():
	if Input.is_action_just_pressed('ui_destruction'):
		$AnimationPlayer.play('floorcube000')
