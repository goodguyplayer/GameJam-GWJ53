extends Node2D

var heads = [
	preload("res://Parts/Head/Head0.tscn"),
	
]

func _ready():
	pass
	

func load_head(value):
	var head = heads[value].instance()
	get_parent().call_deferred("add_child", head)
	head.position = self.position
