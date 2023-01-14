extends KinematicBody2D

export (float) var turndelay = 3

onready var timerturn = get_node("TimerTurn")
onready var triggerboxeye = get_node("Triggerbox-Eye/CollisionShape2D")


func _ready():
	#timerturn.autostart = true
	timerturn.start(turndelay)
	timerturn.connect("timeout", self, "_on_timeout_turn")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_timeout_turn():
	triggerboxeye.position = Vector2( -triggerboxeye.position.x, 0)
