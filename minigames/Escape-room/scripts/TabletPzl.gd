extends "res://minigames/Escape-room/scripts/Background.gd"


var is_on = false

#func _ready():
#	print ("NO WAAAY")

func _on_Plug_pressed():
	get_node("/root/Node2D/PlayerGUI/Label").say("Got it!")
	$Sprite.texture = load("res://minigames/Escape-room/Escape-room_res/Txtrs/close ups/puzzle 3/Untitled_Artwork 48 (UPG).png")
	is_on = true
	$Plug.hide()
	$Plug.disabled = true

func _on_tabloot_pressed():
	if is_on == true:

		$tabloot.hide()
		$Sprite.texture = load("res://minigames/Escape-room/Escape-room_res/Txtrs/close ups/puzzle 3/Untitled_Artwork 50(UPG).png")
		add_child(load("res://minigames/Escape-room/scenes/Simon Says.tscn").instance()) # <-- Loads Simon Says
		print("Imagine that you solved da puzzle... :o")
	else:
		get_node("/root/Node2D/PlayerGUI/Label").say("It's still...")
#		print("It's still...")

