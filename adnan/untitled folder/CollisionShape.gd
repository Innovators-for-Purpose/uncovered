extends CollisionShape


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(_body):
	if(_body.name == "MC") :
		var ap = get_node("../../AnimationPlayer")
		print(ap)
		# ap.set_speed(10)
		ap.play("Animation", -1, 2.0)
		
	pass # Replace with function body.
