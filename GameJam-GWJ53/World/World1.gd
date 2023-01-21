extends Node2D


onready var plot_homing = get_node("Plot/PlotHoming")
onready var plot_sector = get_node("Plot/PlotSector")
onready var plot_core = get_node("Plot/PlotCore")
onready var plot_reveal_core = get_node("Plot/PlotRevealCore")
onready var core = get_node("Enemies/Core")
onready var timer = get_node("Timer")

onready var sound_1 = get_node("Sounds/Sound1")
onready var sound_2 = get_node("Sounds/Sound2")
onready var sound_3 = get_node("Sounds/Sound3")

onready var sound_2_trigger = get_node("Plot/Audio2")
onready var sound_3_trigger = get_node("Plot/Audio3")

var time_spent = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.connect("core_destroyed", self, "_on_core_destroyed")
	GlobalSignals.connect("player_destroyed", self, "_on_player_destroyed")
	timer.connect("timeout", self, "_update_time")
	sound_1.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_PlotHoming_area_entered(area):
	plot_homing.queue_free()
	var textbox = load("res://UI/TextboxHoming.tscn").instance()
	get_tree().current_scene.add_child(textbox)


func _on_PlotSector_area_entered(area):
	plot_sector.queue_free()
	var textbox = load("res://UI/TextboxSector.tscn").instance()
	get_tree().current_scene.add_child(textbox)


func _on_PlotCore_area_entered(area):
	plot_core.queue_free()
	var textbox = load("res://UI/TextboxCore.tscn").instance()
	get_tree().current_scene.add_child(textbox)


func _on_PlotRevealCore_area_entered(area):
	plot_reveal_core.queue_free()
	core.visible = true


func _on_core_destroyed():
	GlobalVariables.time_spent = time_spent
	GlobalVariables.enemies_killed = (get_node("Enemies").get_child_count())
	get_tree().change_scene("res://Menu/Scenes/Victory.tscn")
	

func _on_player_destroyed():
	get_tree().change_scene("res://Menu/Scenes/Defeat.tscn")


func _update_time():
	time_spent += 1
	


func _on_Audio2_area_entered(area):
	sound_2_trigger.queue_free()
	sound_2.play()


func _on_Audio3_area_entered(area):
	sound_3_trigger.queue_free()
	sound_3.play()
