extends Node2D

var torsos = [
	preload("res://Parts/Torso/Torso0.tscn"),
	
]

func _ready():
	pass
	

func load_torso(value):
	var torso = torsos[value].instance()
	get_parent().call_deferred("add_child", torso)
	torso.position = self.position
