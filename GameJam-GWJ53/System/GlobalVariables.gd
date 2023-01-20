extends Node


var player_head = 0
var player_torso = 0
var player_leg = 0
var player_weapon = 0

var player_health = 100 setget set_player_health
var player_max_health = 100 setget set_player_max_health
var player_heat = 0 setget set_player_heat
var player_max_heat = 0 setget set_player_max_heat

var stage_to_load = ""

signal player_health_changed(value)
signal player_health_max_changed(value)
signal player_heat_changed(value)
signal player_heat_max_changed(value)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_player_health(value):
	player_health = value
	emit_signal("player_health_changed", value)
	

func set_player_heat(value):
	player_heat = value
	emit_signal("player_heat_changed", value)


func set_player_max_health(value):
	player_max_health = value
	emit_signal("player_health_max_changed", value)
	
	
func set_player_max_heat(value):
	player_max_heat = value
	emit_signal("player_heat_max_changed", value)
