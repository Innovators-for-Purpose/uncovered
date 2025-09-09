extends Control

onready var Back = $Background
onready var Panel1 = $Panel
onready var Panel2 = $Panel2
onready var Panel3 = $Panel3
onready var ID1 = $NinePatchRect
onready var ID2 = $NinePatchRect2
onready var ID3 = $NinePatchRect3

var active_dialogue = 0 

func _on_WelcomeTimer_timeout():
	active_dialogue = active_dialogue+1

func _ready():
	Back.show()
	#print("Back.hidden", !Back.visible)
	Panel1.hide()
	#print("Panel1.hidden", !Panel1.visible)
	Panel2.hide()
	#print("Panel2.hidden", !Panel2.visible)
	Panel3.hide()
	#print("Panel3.hidden", !Panel3.visible)
	ID1.show()
	#print("ID1.hidden", !ID1.visible)
	ID2.hide()
	#print("ID2.hidden", !ID2.visible)
	ID3.hide()
	#print("ID3.hidden", !ID3.visible)

func _physics_process(_delta):
	if active_dialogue == 1:
		Back.show()
		ID1.hide()
		ID2.hide()
		ID3.hide()
		Panel1.show()
		Panel2.hide()
		Panel3.hide()
	elif active_dialogue == 2:
		Back.show()
		ID1.hide()
		ID2.show()
		ID3.hide()
		Panel1.show()
		Panel2.hide()
		Panel3.hide()
	elif active_dialogue == 3:
		Back.show()
		ID1.hide()
		ID2.hide()
		ID3.hide()
		Panel1.show()
		Panel2.show()
		Panel3.hide()
	elif active_dialogue == 4:
		Back.show()
		ID1.hide()
		ID2.hide()
		ID3.show()
		Panel1.show()
		Panel2.show()
		Panel3.hide()
	elif active_dialogue == 5:
		Back.show()
		ID1.hide()
		ID2.hide()
		ID3.hide()
		Panel1.show()
		Panel2.show()
		Panel3.show()
	elif active_dialogue == 6:
		Back.hide()
		ID1.hide()
		ID2.hide()
		ID3.hide()
		Panel1.hide()
		Panel2.hide()
		Panel3.hide()
