extends Node2D

var legs = [
	preload("res://Parts/Legs/Legs0.tscn"),
	
]

var leg

func _ready():
	pass
	

func load_legs(value):
	leg = legs[value].instance()
	get_parent().call_deferred("add_child", leg)
	leg.position = self.position


func get_health():
	return leg.get_node("LegsStats").max_health
	

func get_heat():
	return leg.get_node("LegsStats").max_heat_capacity