extends Label

func _ready():
	

	
	self.rect_position.x = 384
	self.rect_position.y = 282
	self.hide()

func say(text):
	self.text = text
	show()
	$AnimationPlayer.play("Popup")
