extends ParallaxLayer


func _process(_delta):
	self.position = get_local_mouse_position() * 0.02
	
	
func _on_Button_pressed():
	if $Background.texture == load("res://minigames/Escape-room/Escape-room_res/Txtrs/close ups/puzzle 2/cabinet close up doors closed.png"):
		$Background.texture = load("res://minigames/Escape-room/Escape-room_res/Txtrs/close ups/puzzle 2/cabinet close up doors open with book.png")
		$OpenCabenits.hide()


func _on_OpenBook_pressed():
	if $Background.texture == load("res://minigames/Escape-room/Escape-room_res/Txtrs/close ups/puzzle 2/cabinet close up doors open with book.png"):
		yield(get_tree().create_timer(0.2),"timeout")
		$Background.texture = load("res://minigames/Escape-room/Escape-room_res/Txtrs/close ups/puzzle 2/book closeup.png")


func _ready():
	pass
