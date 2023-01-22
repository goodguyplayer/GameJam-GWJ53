extends Node


export var bullet_used = preload("res://Parts/Bullets/Bullet0.tscn") setget set_bullet_used
export var heat_caused = 0 setget set_heat_caused
export var shoot_delay = 1.5 setget set_shoot_delay
export(String) var part_name = "" setget ,get_part_name
export(String) var part_description = "" setget ,get_part_description

#signal gun_fired()
#signal heat_increased(heat_caused)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_bullet_used(bullet_scene):
	bullet_used = bullet_scene


func set_heat_caused(value):
	heat_caused = value
	

func set_shoot_delay(value):
	shoot_delay = value

func get_part_name():
	return part_name
	
func get_part_description():
	return part_description
