extends Spatial
var framecount = 0
var seconds = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var STOP = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass# Replace with function body.
	"""
func _process(delta):
	framecount += 1
	if framecount%60 == 0:
		seconds += 1
		print(str(seconds))
	"""
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index ==BUTTON_LEFT and event.pressed == true:
			$CSGSphere.visible = false
			print("I am here sir i have done it ")
			
			var root_node = get_node('/root')
			var first_child = root_node.get_children()[0]
			var animation_player_path = ''
			var boss_battle_timer_path = ''
			if first_child.name == 'RootScene':
				animation_player_path = '/root/RootScene/Door1/AnimationPlayer'
				boss_battle_timer_path = '/root/RootScene/MCSRevengeTransport/BossBattleTimer'
			else:
				animation_player_path = '/root/Basement_Door/Door1/AnimationPlayer'
				boss_battle_timer_path = false
				
			get_node(animation_player_path).play("open")
			
			if boss_battle_timer_path:
				get_node(boss_battle_timer_path).start(2)

func _on_Timer_timeout():
	#print("transition")
	var success = true# ProjectSettings.load_resource_pack("res://packs/UncoveredMinigame.zip")
	if success:
		return get_tree().change_scene("res://minigames/BossBattle/Bossgame_.tscn")
	else:
		print("could not load uncovered minigame")


func _on_Area_body_entered(_body):
	pass # Replace with function body.
