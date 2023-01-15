extends Node


export var bullet_direction = Vector2.ZERO setget set_bullet_direction, get_bullet_direction
export var bullet_speed = 0 setget set_bullet_speed, get_bullet_speed
export var destroy_on_impact = true setget set_destroy_impact_bool, get_destroy_impact_bool
export var bullet_damage = 1 setget set_bullet_damage, get_bullet_damage


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_bullet_direction(direction: Vector2):
	bullet_direction = direction


func get_bullet_direction():
	return bullet_direction


func set_bullet_speed(speed: float):
	bullet_speed = speed
	

func get_bullet_speed():
	return bullet_speed
	

func set_destroy_impact_bool(test: bool):
	destroy_on_impact = test
	

func get_destroy_impact_bool():
	return destroy_on_impact


func set_bullet_damage(value: int):
	bullet_damage = value
	

func get_bullet_damage():
	return bullet_damage
