extends Control


onready var score = get_node("MarginContainer/VBoxContainer/Margin-Score/VBoxContainer/HBoxContainer2/Soldiers killed")
onready var time_spent = get_node("MarginContainer/VBoxContainer/Margin-Score/VBoxContainer/HBoxContainer/TimeSpent")

var minutes = 0
var seconds = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	time_calculator()
	score.text = str(GlobalVariables.enemies_killed) + " out of 20"
	time_spent.text = str(minutes) + ":" + str(seconds)
	

func time_calculator():
	minutes = GlobalVariables.time_spent / 60
	seconds = GlobalVariables.time_spent % 60
	if len(str(seconds)) < 2:
		seconds = "0" + str(seconds)
	


func _on_Return_pressed():
	get_tree().change_scene("res://Menu/Scenes/MainMenu.tscn")


func _on_Replay_pressed():
	get_tree().change_scene("res://World/BodyPartsSelection.tscn")
