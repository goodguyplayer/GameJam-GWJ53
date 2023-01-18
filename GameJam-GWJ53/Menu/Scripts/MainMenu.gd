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
	var level_selection = load("res://Menu/Scenes/LevelSelection.tscn").instance()
	get_tree().current_scene.add_child(level_selection)


func _on_Options_pressed():
	pass


func _on_Credits_pressed():
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit()


func _on_Tutorial_pressed():
	get_tree().change_scene("res://World/TutorialIntro.tscn")
