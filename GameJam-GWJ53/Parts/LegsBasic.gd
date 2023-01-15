extends Node2D

var legs = [
	preload("res://Parts/Legs/Legs0.tscn"),
	
]

func _ready():
	pass
	

func load_legs(value):
	var leg = legs[value].instance()
	get_parent().call_deferred("add_child", leg)
	leg.position = self.position
