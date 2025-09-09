extends Node

var active = false

var target_pos = Vector3(0,0,0)
var target_rot = Vector3(0,0,0)

func disable_player_input():
	get_tree().get_root().set_disable_input(true)


func enable_player_input():
	get_tree().get_root().set_disable_input(false)

