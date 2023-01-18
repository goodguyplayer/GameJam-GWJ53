extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextboxEntry_textbox_end(title):
	var level_selection = load("res://World/BodyPartsSelection.tscn").instance()
	get_tree().current_scene.add_child(level_selection)
