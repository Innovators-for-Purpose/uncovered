extends Node2D


signal scored(level)

export(NodePath) var buttons_container
onready var buttons = get_node(buttons_container).get_children()
onready var audio_player = $AudioStreamPlayer
var level = 1
var cpu_sequence = []
var player_sequence = []
var sequence_pos = 0
var playing_cpu_sequence = false

onready var tiles = $Buttons.get_children()

func _ready():
	pause_mode = Node.PAUSE_MODE_STOP
	randomize()
#	connect_buttons_signals()
	initialize_game()

# ---------------------------------------------

func initialize_game():
	level = 1
#	update_score_ui()

	# reset generated sequences
	reset_cpu_sequence()
	reset_player_sequence()

	# generate a new sequence
	generate_cpu_sequence()

	# disable player input while CPU sequence is playing
	Global.disable_player_input()
	yield(get_tree().create_timer(2), "timeout")

	play_cpu_sequence()


# --------------------------------------------




func reset_cpu_sequence():
	cpu_sequence.clear()


func reset_player_sequence():
	player_sequence.clear()
	sequence_pos = 0



func generate_cpu_sequence():
	cpu_sequence.push_back(randi() % buttons.size())
	print("cpu sequence: %s" % str(cpu_sequence))


func play_cpu_sequence():
	playing_cpu_sequence = true
	Global.disable_player_input()

	for i in cpu_sequence:
		var button = buttons[i]
		button.press()
		yield(get_tree().create_timer(0.8), "timeout")
	playing_cpu_sequence = false
	Global.enable_player_input()

func update_score_ui():
	emit_signal("scored", level)

# --------------------------------------------------------

func check_game_status():
	if cpu_sequence[sequence_pos] == player_sequence[sequence_pos]:
		sequence_pos += 1
		if cpu_sequence.size() == player_sequence.size():
			print("generating new sequence for level %d" % level)
			update_score_ui()
			level += 1
			#----------------------
			if level == 6:
				audio_player.stream = load("res://assets/Audio/tblt_win.wav")
#				Global.disable_player_input()
				for i in buttons:
					i.animation_player.play("tblt_win")
					audio_player.play()
				yield(get_tree().create_timer(3),"timeout")
				get_node("/root/Node2D/GearBox/ParallaxLayer/Key").show()
				get_node("/root/Node2D/GearBox/ParallaxLayer/Sprite").texture = load("res://minigames/Escape-room/Escape-room_res/Txtrs/close ups/puzzle 4/open_panel_lever_turned.png")
				get_node("/root/Node2D/PlayerGUI/Label").say("I heard something unlock!")
				get_tree().paused = true
				
#				get_tree().paused = true
			#----------------------
			else:
				generate_cpu_sequence()

				yield(get_tree().create_timer(2), "timeout")
#			globals.sleep(2)

				play_cpu_sequence()
				reset_player_sequence()
	else:
		print("Game Over!!")
		game_over()


func game_over():
	audio_player.stream = load("res://assets/Audio/tblt_wrong.mp3")
	level = 1
	audio_player.play()
	for i in buttons:
		i.animation_player.play("tblt_lost")
	yield(get_tree().create_timer(3), "timeout")
	for i in buttons:
		i.animation_player.play("RESET")
	update_score_ui()
	initialize_game()

# --------------------------------------------------------


func _on_Button_pressed(code):
	print("_on_Button_pressed(" + str(code) + ")")
	if playing_cpu_sequence:
		return
	player_sequence.push_back(code) 
	print("player sequence: %s" % str(player_sequence))
	check_game_status()


