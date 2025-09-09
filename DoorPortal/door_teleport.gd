extends Spatial

export var id = 0

var lock_door = false

func lock_self():
	lock_door = true
	yield(get_tree().create_timer(0.3),"timeout")
	lock_door = false
