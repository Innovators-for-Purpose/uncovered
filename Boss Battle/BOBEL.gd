extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
onready var player = ("/root/Node2D/Node2D/McBody/")

func _on_Area2D_body_entered(body):
	print(body.name)
	if body.name == 'MC_body':
		print("bobel entered")
		get_node("bobel_body").visible = false
		
