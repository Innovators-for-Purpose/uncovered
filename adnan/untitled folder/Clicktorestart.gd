extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var MC = get_node("/root/RootScene/Node2D/Enviroment/MC")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
var left_click_active = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if left_click_active == true and Input.is_action_just_pressed("Shoot"):
		MC.translation = Vector3(-25.208,12.517,15.989)
		pass # Replace with function body.



func _on_Area_body_entered(body):
	if body.name == "MC":
		MC = body
		left_click_active = true
		popup()
