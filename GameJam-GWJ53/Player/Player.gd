extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var movement = 0

func get_input():
	velocity = Vector2.ZERO
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	


func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity * speed)
