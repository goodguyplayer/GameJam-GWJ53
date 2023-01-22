extends Node2D


onready var camera = get_node("Camera2D")
onready var enemy_guide = get_node("EnemyGuide")
onready var gate_guide = get_node("ExitGuide")


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.connect("player_destroyed", self, "_on_player_destroyed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_quit_world"):
		get_tree().change_scene("res://Menu/Scenes/MainMenu.tscn")


func _on_EnemyGuide_area_entered(area):
	enemy_guide.queue_free()
	var enemy_guide_textbox = load("res://UI/TextboxEnemyGuideTutorial.tscn").instance()
	get_tree().current_scene.add_child(enemy_guide_textbox)


func _on_ExitGuide_area_entered(area):
	gate_guide.queue_free()
	var gate_guide_textbox = load("res://UI/TextboxExitGateTutorial.tscn").instance()
	get_tree().current_scene.add_child(gate_guide_textbox)


func _on_player_destroyed():
	get_tree().change_scene("res://Menu/Scenes/Defeat.tscn")
