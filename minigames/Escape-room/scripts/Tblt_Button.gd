extends ColorRect


onready var animation_player = $AnimationPlayer
onready var audio_player = $AudioStreamPlayer
export(int) var id = 0
signal pressed(id)

func _ready():
	color = Color.deeppink
	$Light2D.color = Color.deeppink
#	$AnimationPlayer.play("Escape-roomlost")
	if self.name == "Button1":
		$Light2D.color = Color.chartreuse
		color = Color.chartreuse.darkened(0.15)
	if self.name == "Button2":
		$Light2D.color = Color.purple
		color = Color.purple.darkened(0.15)
	if self.name == "Button3":
		$Light2D.color = Color.orange
		color = Color.orange.darkened(0.15)
	if self.name == "Button4":
		$Light2D.color = Color.yellow
		color = Color.yellow.darkened(0.15)
	if self.name == "Button5":
		$Light2D.color = Color.cyan
		color = Color.cyan.darkened(0.15)
	
	audio_player.stream = load("res://assets/Audio/tone%d.wav" % id)

var _cont = connect("gui_input",self,"_on_Button_gui_input")


func _on_Button_gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		press()

func press():
	if not animation_player.is_playing():
		animation_player.play("pulse")
		audio_player.play()
	emit_signal("pressed")
