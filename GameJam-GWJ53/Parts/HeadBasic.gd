extends Node2D

var heads = [
	("res://Parts/Head/Head0.tscn"),
	("res://Parts/Head/Head1.tscn"),
	("res://Parts/Head/Head2.tscn"),
	
]

var stats
var hitbox

signal limb_hit()


func _ready():
	pass
	

func load_head(value):
	var head = load(heads[value]).instance()
	get_parent().call_deferred("add_child", head)
	head.position = self.position
	stats = head.get_node("HeadStats")
	hitbox = head.get_node("Hurtbox")
	hitbox.connect("area_entered", self, "_on_area_entered")


func _on_area_entered(area):
	emit_signal("limb_hit")
	
#
#func get_health():
#	return head.get_node("HeadStats").max_health
#
#
#func get_heat():
#	return head.get_node("HeadStats").max_heat_capacity
