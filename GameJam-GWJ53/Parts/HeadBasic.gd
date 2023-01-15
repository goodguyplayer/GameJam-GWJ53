extends Node2D

var heads = [
	preload("res://Parts/Head/Head0.tscn"),
	
]

var head


func _ready():
	pass
	

func load_head(value):
	head = heads[value].instance()
	get_parent().call_deferred("add_child", head)
	head.position = self.position


func get_health():
	return head.get_node("HeadStats").max_health
	

func get_heat():
	return head.get_node("HeadStats").max_heat_capacity
