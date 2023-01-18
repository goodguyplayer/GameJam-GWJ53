extends Node2D

var torsos = [
	preload("res://Parts/Torso/Torso0.tscn"),
	
]

var stats
var hitbox

export var size = 0 setget , get_part_size


signal limb_hit()


func _ready():
	size = len(torsos) - 1
	

func load_torso(value):
	var torso = torsos[value].instance()
	get_parent().call_deferred("add_child", torso)
	torso.position = self.position
	stats = torso.get_node("TorsoStats")
	hitbox = torso.get_node("Hurtbox")
	hitbox.connect("area_entered", self, "_on_area_entered")


func _on_area_entered(area):
	emit_signal("limb_hit")


func get_part_size():
	return size
	
#
#func get_heat():
#	return torso.get_node("TorsoStats").max_heat_capacity
#
