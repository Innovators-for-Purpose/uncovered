extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#play("open")
	pass # Replace with function body.

var animation_played = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	if body.name == "MC" and animation_played == false:	
		get_node('.').play("open")
		animation_played = true 
	pass # Replace with function body.
