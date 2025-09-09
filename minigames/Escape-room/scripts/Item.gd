extends Node2D


var item_name


# Called when the node enters the scene tree for the first time.
func _ready():
	var rand_val = randi() % 2
	if rand_val == 0:
		item_name = "Door Key"
	else:
		item_name = "Gear Box Key"
	
	$TextureRect.texture = load("res://minigames/Escape-room/Item_Icons/" + item_name + ".png")

func set_item(nm):
	item_name = nm
	$TextureRect.texture = load("res://minigames/Escape-room/Item_Icons/" + item_name + ".png")
