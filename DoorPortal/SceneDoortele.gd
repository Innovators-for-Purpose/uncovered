extends Spatial
export var target_position : Vector3 = Vector3(0.0, 0.0, 0.0)
export var target_rot : Vector3 = Vector3(0.0,0.0,0.0)
export(String, FILE, "*.tscn") var destination
var scene2 = null

#func _ready():
#	target_position = target_position
#	print(target_position)
