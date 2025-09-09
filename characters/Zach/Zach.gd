extends Area

var currently_colliding = false

func _ready():
	visible = true

func _on_Area_body_entered(body):
	if body.name == "MC":
		currently_colliding = true
	if currently_colliding == true:
		#print("testing")
		pass
