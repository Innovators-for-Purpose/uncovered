extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_Area2D_body_entered(body):
	print("In body enterd")
	print(body)
	
	if "bullet" == body.name:
		body.queue_free()
