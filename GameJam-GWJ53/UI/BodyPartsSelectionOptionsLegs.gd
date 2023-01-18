extends Control

onready var leg = get_node("MarginContainer/VBoxContainer/VBoxContainer/Legs")
onready var title = get_node("MarginContainer/VBoxContainer/VBoxContainer2/Panel/VBoxContainer/Title")
onready var description = get_node("MarginContainer/VBoxContainer/VBoxContainer2/Panel/VBoxContainer/Description")

var size_limb = 0
var count = 0 setget ,get_limb_count


# Called when the node enters the scene tree for the first time.
func _ready():
	size_limb = leg.size
	load_limb(count)


func _on_Previous_pressed():
	if count - 1 < 0:
		count = size_limb
	else:
		count -= 1
	load_limb(count)


func _on_Next_pressed():
	if count + 1 > size_limb:
		count = 0
	else:
		count += 1
	load_limb(count)
	

func load_limb(count):
	leg.load_legs(count)
	title.text = leg.stats.part_name
	description.text = leg.stats.part_description
	
	
func get_limb_count():
	return count
