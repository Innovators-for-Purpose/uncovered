extends Label

onready var goals = get_node("/root/CreationScene/GoalHolder")

func _process(_delta):
	goals.time = float(OS.get_ticks_msec())/1000
	text = "Time Elapsed: "+str(goals.time-(goals.last_time/1000))+"s"
	text += "\n-1 point for\nevery 7 seconds!"
