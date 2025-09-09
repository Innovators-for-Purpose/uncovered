extends Node2D
var rng = RandomNumberGenerator.new()
var Code = {1: "code1", 2: "code2",  3: "code3",}

func _process(_delta):
	print(Code[rng.randi_range(1, 3)])

