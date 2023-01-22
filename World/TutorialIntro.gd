extends Node2D


func _on_TextboxEntry_textbox_end(title):
	GlobalVariables.stage_to_load = "res://World/Tutorial.tscn"
	get_tree().change_scene("res://World/BodyPartsSelection.tscn")
