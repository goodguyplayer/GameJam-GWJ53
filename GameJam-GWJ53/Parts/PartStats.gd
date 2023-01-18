extends Node


export(int) var max_health = 1 setget ,get_max_health
export(int) var max_heat_capacity = 1 setget ,get_heat_capacity
export(int) var max_speed = 400 setget ,get_max_speed
export(int) var max_jump_height = -400 setget ,get_max_jump_height
export(String) var part_name = "" setget ,get_part_name
export(String) var part_description = "" setget ,get_part_description


func get_max_health():
	return max_health
	

func get_heat_capacity():
	return max_heat_capacity


func get_max_speed():
	return max_speed
	
	
func get_max_jump_height():
	return max_jump_height


func get_part_name():
	return part_name
	
	
func get_part_description():
	return part_description
