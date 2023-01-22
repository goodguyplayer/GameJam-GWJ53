extends Control

onready var head = get_node("MarginContainer/VBoxContainer/VBoxContainer/Head")
onready var title = get_node("MarginContainer/VBoxContainer/VBoxContainer2/Panel/VBoxContainer/Title")
onready var description = get_node("MarginContainer/VBoxContainer/VBoxContainer2/Panel/VBoxContainer/Description")

var size_limb = 0
var count = 0 setget ,get_limb_count


# Called when the node enters the scene tree for the first time.
func _ready():
	size_limb = head.size
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
	head.load_head(count)
	title.text = head.stats.part_name
	description.text = head.stats.part_description
	
	
func get_limb_count():
	return count
