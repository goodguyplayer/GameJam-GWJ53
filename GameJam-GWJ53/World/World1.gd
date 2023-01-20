extends Node2D


onready var plot_homing = get_node("Plot/PlotHoming")
onready var plot_sector = get_node("Plot/PlotSector")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlotHoming_area_entered(area):
	plot_homing.queue_free()
	var textbox = load("res://UI/TextboxHoming.tscn").instance()
	get_tree().current_scene.add_child(textbox)


func _on_PlotSector_area_entered(area):
	plot_sector.queue_free()
	var textbox = load("res://UI/TextboxSector.tscn").instance()
	get_tree().current_scene.add_child(textbox)
