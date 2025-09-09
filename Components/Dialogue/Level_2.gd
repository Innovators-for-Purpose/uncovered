extends Control
#onready var Px = $Panel
#onready var Lx = $Panel/Label
#onready var IDx = $Panel/NinePatchRect
#onready var TQx = $Panel/NinePatchRect2
#onready var NQx = $Panel/NinePatchRect2/Label
#onready var IQx = $Panel/Backtext
#
#var active_dialogue = 0
#
#func _ready() -> void:
#	pass
#
#func _physics_process(delta):
#	if  active_dialogue == 0 and Input.is_action_just_pressed("game_usage") == false:
#		visible = false
#
#	if Input.is_action_just_pressed("game_usage") == true:
#		active_dialogue = active_dialogue+1
#		visible = true
#
#	if active_dialogue == 1:
#		Lx.text = "T1"
#		NQx.text = "you"
#		IQx.show()
#		Px.show()
#		IDx.show()
#		TQx.show()
#
#	if active_dialogue == 2:
#		Lx.text = "T2"
#		NQx.text = "Zach"
#		IQx.show()
#		Px.show()
#		IDx.show()
#		TQx.show()
