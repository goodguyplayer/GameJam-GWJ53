extends Node

export(int) var max_health = 1 setget set_max_health, get_max_health
export(int) var max_heat = 1 setget set_max_heat, get_max_heat
var health = max_health setget set_health, get_health
var heat = max_heat setget set_heat, get_heat

signal no_health
signal health_changed(value)
signal heat_changed(value)
signal max_health_changed(value)
signal max_heat_changed(value)
signal max_heat_reached()

func set_max_health(value):
	max_health = value
	self.health = min(health, max_health)
	emit_signal("max_health_changed", max_health)
	

func get_max_health():
	return max_health
	

func set_max_heat(value):
	max_heat = value
	self.heat = min(heat, max_heat)
	emit_signal("heat_changed", heat)
	if heat == max_heat:
		emit_signal("max_heat_reached")
		

func get_max_heat():
	return max_heat


func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")
		

func get_health():
	return health
		
	
func set_heat(value):
	heat = value
	emit_signal("heat_changed", heat)
	
	
func get_heat():
	return heat
		

func _ready():
	self.health = max_health
	self.heat = 0
