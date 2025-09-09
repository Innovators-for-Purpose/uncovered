tool
extends Light2D

onready var timer = $Timer
onready var light = self

func _ready():
	randomize()


func _on_Timer_timeout():
	var rand_amt = (randf())
#	print(rand_amt)
	energy = rand_amt
	if rand_amt < 0.50:
		energy = 1
	elif rand_amt > 0.75:
		energy = 0.75
	timer.start(rand_range(0.03,0.2))
#	print(timer.wait_time)
