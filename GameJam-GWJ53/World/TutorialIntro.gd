extends Node2D


func _on_TextboxEntry_textbox_end(title):
	get_tree().change_scene("res://World/BodyPartsSelection.tscn")
