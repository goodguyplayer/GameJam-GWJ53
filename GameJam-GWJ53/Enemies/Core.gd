extends KinematicBody2D


var health = 50

onready var health_bar = get_node("ProgressBar")

onready var core_sound_1 = get_node("CoreNoise1")
onready var core_sound_2 = get_node("CoreNoise2")
onready var core_sound_3 = get_node("CoreNoise3")
onready var core_sound_4 = get_node("CoreNoise4")
onready var core_sound_5 = get_node("CoreNoise5")

var core_sounds = [core_sound_1, core_sound_2, core_sound_3, core_sound_4, core_sound_5]

var random = RandomNumberGenerator.new()

func _ready():
	random.randomize()
	health_bar.max_value = health
	health_bar.value = health
	

func _on_Hurtbox_area_entered(_area):
	health_bar.visible = true
	health -= 10
	health_bar.value = health
	if health <= 0:
		GlobalSignals.emit_signal("core_destroyed")
		queue_free()


func _on_Timer_timeout():
	var random_result = random.randi_range(0, 4)
	match random_result:
		0:
			core_sound_1.play()
		1:
			core_sound_2.play()
		2:
			core_sound_3.play()
		3:
			core_sound_4.play()
		4:
			core_sound_5.play()
