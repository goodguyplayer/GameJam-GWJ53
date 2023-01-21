extends Node

export(int) var max_health = 1 setget set_max_health, get_max_health
export(int) var max_heat = 1 setget set_max_heat, get_max_heat
var health = max_health setget set_health, get_health
var heat = 0 setget set_heat, get_heat

signal no_health
signal health_changed(value)
signal heat_changed(value)
signal max_health_changed(value)
signal max_heat_changed(value)
signal max_heat_reached()

func set_max_health(value):
	max_health = value
	self.health = min(health, max_health)
	GlobalSignals.emit_signal("player_health_max_changed", value)
	emit_signal("max_health_changed", max_health)
	

func get_max_health():
	return max_health
	
	
func set_max_heat(value):
	max_heat = value
	GlobalSignals.emit_signal("player_heat_max_changed", value)
	GlobalSignals.emit_signal("player_heat_changed", 0)
		
		
func get_max_heat():
	return max_heat


func set_health(value):
	health = value
	emit_signal("health_changed", health)
	GlobalSignals.emit_signal("player_health_changed", health)
	if health <= 0:
		GlobalSignals.emit_signal("player_destroyed")
		emit_signal("no_health")
		

func get_health():
	return health
		
	
func set_heat(value):
	heat = min(value, max_heat)
	emit_signal("heat_changed", heat)
	GlobalSignals.emit_signal("player_heat_changed", heat)
	if heat == max_heat:
		GlobalSignals.emit_signal("max_heat_reached")
	
	
	
func get_heat():
	return heat
		

func _ready():
	self.health = max_health
	self.heat = 0
