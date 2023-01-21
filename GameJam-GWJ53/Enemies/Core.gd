extends KinematicBody2D


var health = 50

onready var health_bar = get_node("ProgressBar")

func _ready():
	health_bar.max_value = health
	health_bar.value = health
	

func _on_Hurtbox_area_entered(_area):
	health_bar.visible = true
	health -= 10
	health_bar.value = health
	if health <= 0:
		GlobalSignals.emit_signal("core_destroyed")
		queue_free()
