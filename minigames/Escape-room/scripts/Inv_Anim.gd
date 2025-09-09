extends TextureButton



var holding_item = null

#func _ready():
#	pass

func _on_TextureButton_toggled(button_pressed):
	if button_pressed == true:
		$Inventory/AnimationPlayer.play("grid-scale")
	else:
		$Inventory/AnimationPlayer.play_backwards("grid-scale")

func _on_TextureButton_pressed():
	var tween = create_tween()
	tween.tween_property(self, "rect_scale", Vector2(0.5,0.5), 0.05)
	tween.tween_property(self, "rect_scale", Vector2(0.472,0.472), 0.05)
	$Inventory.initinalize_Inventory()




func _on_Key_emit():
	var tween = create_tween()
	$CPUParticles2D.emitting = true
	tween.tween_property(self, "rect_scale", Vector2(0.5,0.5), 0.05)
	tween.tween_property(self, "rect_scale", Vector2(0.472,0.472), 0.05)
