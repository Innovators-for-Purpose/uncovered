extends CanvasLayer

export(String, FILE, "*.json") var dialogue_file
var dialogues = []
var current_dialogue_id = 0
var cooldown_time

func _ready():
	load_dialogue()
func load_dialogue():
	var file = File.new()
	if file.file_exists(dialogue_file):
		file.open(dialogue_file, file.READ)
		return parse_json(file.get_as_text())
		
	# print (file.file_exists(dialogue_file))
func speak(): 
	return
	# text box pops up. 
