extends Control


export var level = ""
export var level_number = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Number.text = str(level_number)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene(level)
