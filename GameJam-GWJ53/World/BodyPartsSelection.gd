extends Control


onready var head = get_node("MarginContainer/VBoxContainer2/BodyPartSelector/Head")
onready var torso = get_node("MarginContainer/VBoxContainer2/BodyPartSelector/Torso")
onready var legs = get_node("MarginContainer/VBoxContainer2/BodyPartSelector/Legs")
onready var weapon = get_node("MarginContainer/VBoxContainer2/BodyPartSelector/Weapon")

export var level_to_load = "res://World/Tutorial.tscn"


# Called when the node enters the scene tree for the first time.
func _ready():
	level_to_load = GlobalVariables.stage_to_load


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Return_pressed():
	get_tree().change_scene("res://Menu/Scenes/MainMenu.tscn")


func _on_Accept_pressed():
	GlobalVariables.player_head = head.count
	GlobalVariables.player_torso = torso.count
	GlobalVariables.player_leg = legs.count
	GlobalVariables.player_weapon = weapon.count
	get_tree().change_scene(level_to_load)
