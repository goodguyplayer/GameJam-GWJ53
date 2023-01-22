extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Start.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	GlobalVariables.stage_to_load = "res://World/World1.tscn"
	get_tree().change_scene("res://World/BodyPartsSelection.tscn")


func _on_Options_pressed():
	var options = load("res://Menu/Scenes/Options.tscn").instance()
	get_tree().current_scene.add_child(options)


func _on_Credits_pressed():
	var credits = load("res://Menu/Scenes/Credits.tscn").instance()
	get_tree().current_scene.add_child(credits)


func _on_Quit_pressed():
	get_tree().quit()


func _on_Tutorial_pressed():
	GlobalVariables.stage_to_load = "res://World/Tutorial.tscn"
	get_tree().change_scene("res://World/TutorialIntro.tscn")
