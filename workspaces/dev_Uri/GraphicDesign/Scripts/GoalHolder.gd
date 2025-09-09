extends Node

onready var settings = get_node("/root/CreationScene/Settings")
onready var main = get_node("/root/CreationScene")
onready var square = get_children()[0]
onready var holder = KinematicBody2D.new()
var holders = {}
var reduction_scale = 3

var last_score = 0
var total_score = 0

var time = 0
var last_time = 0

# Name of symbol or NONE for nothing

var designs = [["Heart","Heart","NONE","Heart","Heart",
				"Heart","NONE", "Heart","NONE","Heart",
				"Heart", "NONE", "NONE","NONE","Heart",
				"NONE", "Heart", "NONE","Heart","NONE",
				"NONE", "NONE", "Heart", "NONE","NONE"],
				
				["Square","NONE","NONE","NONE","Square",
				"NONE","Square","Skull","Square","NONE",
				"NONE", "Skull", "Star", "Skull","NONE",
				"NONE","Square","Skull","Square","NONE",
				"Square","NONE","NONE","NONE", "Square"],
				
				["NONE",   "NONE",  "NONE",  "NONE",  "NONE",
				"NONE", "Star", "Triangle", "Star",   "NONE",
				"NONE","Triangle","Circle","Triangle","NONE",
				"NONE", "Star", "Triangle",  "Star",  "NONE",
				"NONE",   "NONE",  "NONE",  "NONE",   "NONE"],
				
				["NONE","Circle","Circle","Circle","NONE",
				"Circle", "NONE", "NONE","NONE","Circle",
				"Circle", "NONE", "NONE", "NONE","Circle",
				"Circle", "NONE", "NONE", "NONE","Circle",
				"NONE","Circle","Circle","Circle","NONE"],
				
				["NONE",    "NONE",     "NONE",     "NONE",     "NONE",
				"NONE",    "NONE",    "Triangle",    "NONE",    "NONE",
				"NONE",  "Triangle",  "Triangle",  "Triangle",  "NONE",
				"Triangle","Triangle","Triangle","Triangle","Triangle",
				"NONE",     "NONE",     "NONE",     "NONE",     "NONE"],
				
				["Square","Square","Square","Square","Square",
				"Square", "NONE",  "NONE",  "NONE",  "Square",
				"Square", "NONE",  "NONE",  "NONE",  "Square",
				"Square", "NONE",  "NONE",  "NONE",  "Square",
				"Square","Square","Square","Square","Square"]]

var returned_pos = Vector2()

func create_design(name: String, square2: MeshInstance2D):
	if name != "NONE":
		var symbol = get_node("/root/CreationScene/Symbols/"+name+"Symbol").duplicate()
		symbol.visible = true
		symbol.scale /= reduction_scale
		symbol.position = square2.position
		symbol.z_index = -20
		holder.add_child(symbol)

func create_button(total):
	var clone = get_children()[1].duplicate()
	clone.visible = true
	clone.position.x += (((settings.GRID_SQUARE_MARGIN/reduction_scale)*settings.GRID_LENGTH)+settings.GRID_MARGIN)*total
	clone.z_index = -21
	clone.get_children()[0].design = total
	holder.add_child(clone)

func create_grid(design, t) -> Vector2:
	main.add_child(holder)
	var total = 0
	for i in range(settings.GRID_LENGTH):
		for j in range(settings.GRID_LENGTH):
			var clone = square.duplicate()
			clone.visible = true
			clone.scale = Vector2(settings.GRID_SQUARE_LENGTH/reduction_scale, settings.GRID_SQUARE_LENGTH/reduction_scale)
			var pos_x = (((settings.GRID_MARGIN/reduction_scale)+clone.scale.x/2)+((settings.GRID_SQUARE_MARGIN/reduction_scale)*j)+(settings.GRID_SQUARE_MARGIN*settings.GRID_LENGTH)+settings.GRID_MARGIN)
			pos_x += (((settings.GRID_SQUARE_MARGIN/reduction_scale)*settings.GRID_LENGTH)+(settings.GRID_MARGIN/reduction_scale)*3)*t
			var pos_y = ((settings.GRID_MARGIN/reduction_scale)+clone.scale.x/2)+((settings.GRID_SQUARE_MARGIN/reduction_scale)*i)+settings.GRID_MARGIN-5
			clone.position = Vector2(pos_x, pos_y)
			clone.z_index = -21
			create_design(design[total], clone)
			holder.add_child(clone)
			if total == 20:
				returned_pos = clone.position
			total += 1
	create_button(t)
	holders[t] = holder
	holder = StaticBody2D.new()
	return returned_pos

func _ready():
	var total = 0
	for design in designs:
		call_deferred("create_grid", design, total)
		total += 1
