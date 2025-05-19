extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var MC = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("Shoot"):
		MC.translation = Vector3(-25.208,12.517,15.989)
		



func _on_Area_body_entered(body):
	if body.name == "MC":
		MC = body
		var dialog = Dialogic.start('basement')
		dialog.connect("dialogic_signal", self, "dialog_listener")
		add_child(dialog)
