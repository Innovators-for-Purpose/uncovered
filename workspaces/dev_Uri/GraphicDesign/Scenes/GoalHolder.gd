extends Node

onready var settings = get_node("/root/CreationScene/Settings")
onready var square = get_children()[0]
var reduction_scale = 3

var designs = [["NONE, Skull, NONE, Skull, NONE",
				"Skull, NONE, Skull, NONE, Skull",
				"NONE, Skull, NONE, Skull, NONE",
				"Skull, NONE, Skull, NONE, Skull",
				"NONE, Skull, NONE, Skull, NONE"]]

func create_design(name: String, square: MeshInstance2D):
	if name != "NONE":
		var symbol = get_node("/root/CreationScene/Symbols/"+name+"Symbol").duplicate()
		symbol.scale /= reduction_scale
		symbol.position = square.position
		square.add_child(symbol)

func create_grid(design, total):
	total = 0
	for i in range(settings.GRID_LENGTH):
		for j in range(settings.GRID_LENGTH):
			var clone = square.duplicate()
			clone.visible = true
			clone.scale = Vector2(settings.GRID_SQUARE_LENGTH/reduction_scale, settings.GRID_SQUARE_LENGTH/reduction_scale)
			var pos_x = (((settings.GRID_MARGIN/reduction_scale)+clone.scale.x/2)+((settings.GRID_SQUARE_MARGIN/reduction_scale)*j)+(settings.GRID_SQUARE_MARGIN*settings.GRID_LENGTH)+settings.GRID_MARGIN)*total
			var pos_y = ((settings.GRID_MARGIN/reduction_scale)+clone.scale.x/2)+((settings.GRID_SQUARE_MARGIN/reduction_scale)*i)+settings.GRID_MARGIN-5
			clone.position = Vector2(pos_x, pos_y)
			clone.z_index = -20
			create_design(design[total], clone)
			add_child(clone)
			total += 1


func _ready():
	var total = 0
	for design in designs:
		create_grid(design, total)
		total += 1
