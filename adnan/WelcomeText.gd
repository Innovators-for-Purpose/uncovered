extends CanvasLayer
var count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true

func _physics_process(_delta):
	if Input.is_action_just_pressed("game_usage"):
		get_node('.').visible = false
