extends Control


onready var health_bar = get_node("MarginContainer/ProgressBar")


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.connect("player_health_max_changed", self, "set_max_health")
	GlobalSignals.connect("player_health_changed", self, "set_health")


func set_health(value):
	health_bar.value = value


func set_max_health(value):
	health_bar.max_value = value
