extends Node2D


onready var camera = get_node("Camera2D")
onready var enemy_guide = get_node("EnemyGuide")
onready var gate_guide = get_node("ExitGuide")

onready var jump = get_node("Jump/MarginContainer/Label")
onready var fire = get_node("Fire/MarginContainer/Label")
onready var escape = get_node("Escape/MarginContainer/Label")


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.connect("player_destroyed", self, "_on_player_destroyed")
	jump.text = 'Press "%s" To jump' % InputMap.get_action_list("ui_up")[0].as_text()
	fire.text = 'Press "%s" To fire' % InputMap.get_action_list("ui_shoot")[0].as_text()
	escape.text = 'Press "%s" To exit' % InputMap.get_action_list("ui_quit_world")[0].as_text()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("ui_quit_world"):
		get_tree().change_scene("res://Menu/Scenes/MainMenu.tscn")


func _on_EnemyGuide_area_entered(_area):
	enemy_guide.queue_free()
	var enemy_guide_textbox = load("res://UI/TextboxEnemyGuideTutorial.tscn").instance()
	get_tree().current_scene.add_child(enemy_guide_textbox)


func _on_ExitGuide_area_entered(_area):
	gate_guide.queue_free()
	var gate_guide_textbox = load("res://UI/TextboxExitGateTutorial.tscn").instance()
	get_tree().current_scene.add_child(gate_guide_textbox)


func _on_player_destroyed():
	get_tree().change_scene("res://Menu/Scenes/Defeat.tscn")
