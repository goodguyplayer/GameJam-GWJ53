extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Return_pressed():
	get_tree().change_scene("res://Menu/Scenes/MainMenu.tscn")
	

func _on_TryAgain_pressed():
	get_tree().change_scene(GlobalVariables.stage_to_load)


func _on_Replay_pressed():
	get_tree().change_scene("res://World/BodyPartsSelection.tscn")
