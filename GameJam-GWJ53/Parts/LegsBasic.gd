extends Node2D

var legs = [
	("res://Parts/Legs/Legs0.tscn"),
	("res://Parts/Legs/Legs1.tscn"),
	("res://Parts/Legs/Legs2.tscn"),
	
]

var stats
var hitbox


signal limb_hit()


func _ready():
	pass
	

func load_legs(value):
	var leg = load(legs[value]).instance()
	get_parent().call_deferred("add_child", leg)
	leg.position = self.position
	stats = leg.get_node("LegsStats")
	hitbox = leg.get_node("Hurtbox")
	hitbox.connect("area_entered", self, "_on_area_entered")


func _on_area_entered(area):
	emit_signal("limb_hit")
#
#
#func get_heat():
#	return leg.get_node("LegsStats").max_heat_capacity
