extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pass # Replace with function body.

var counter = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if Input.is_action_just_pressed("game_usage") and counter < 8:
		#print (counter)
		get_node("/root/RootScene/BASEMENT/Conversation/Node2D/Instructions/MarginContainer/HBoxContainer/Label" + str(counter)).visible = false
		get_node("/root/RootScene/BASEMENT/Conversation/Node2D/Instructions/MarginContainer/HBoxContainer/Label" + str(counter + 1)).visible = true
		counter += 1
	elif Input.is_action_just_pressed("game_usage"):
		dialogue_done = true		
		
		
		
		
		
	pass

var dialogue_done = false
func _on_Area3_body_entered(body):
	if body.name == "MC" and !dialogue_done:
		get_node("/root/RootScene/BASEMENT/Conversation").visible = true
	elif dialogue_done:
		get_node("/root/RootScene/BASEMENT/Conversation").visible = true
				
	pass # Replace with function body.
