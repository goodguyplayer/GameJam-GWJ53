extends Node2D

var legs = [
	("res://Parts/Legs/Legs0.tscn"),
	("res://Parts/Legs/Legs1.tscn"),
	("res://Parts/Legs/Legs2.tscn"),
	("res://Parts/Legs/Legs3.tscn"),
	("res://Parts/Legs/Legs4.tscn"),
	("res://Parts/Legs/Legs5.tscn"),
]

var stats
var hitbox

export var size = 0 setget , get_part_size


signal limb_hit()


func _ready():
	size = len(legs) - 1
	
	

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
func get_part_size():
	return size
