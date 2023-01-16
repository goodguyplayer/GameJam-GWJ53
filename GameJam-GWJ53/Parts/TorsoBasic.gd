extends Node2D

var torsos = [
	preload("res://Parts/Torso/Torso0.tscn"),
	
]

var stats

func _ready():
	pass
	

func load_torso(value):
	var torso = torsos[value].instance()
	get_parent().call_deferred("add_child", torso)
	torso.position = self.position
	stats = torso.get_node("TorsoStats")
	

#func get_health():
#	return torso.get_node("TorsoStats").max_health
#
#
#func get_heat():
#	return torso.get_node("TorsoStats").max_heat_capacity
#
