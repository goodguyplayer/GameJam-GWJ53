extends Control


onready var heat_bar = get_node("MarginContainer/ProgressBar")


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.connect("player_heat_changed", self, "set_heat")
	GlobalSignals.connect("player_heat_max_changed", self, "set_max_heat")


func set_heat(value):
	heat_bar.value = value

func set_max_heat(value):
	heat_bar.max_value = value
