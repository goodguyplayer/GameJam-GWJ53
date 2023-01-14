extends KinematicBody2D


export (int) var speed = 400
export (int) var gravity = 800
export (int) var jump_speed = -400

# -500 -- 2 blocks
# -400 -- 1 block

var velocity = Vector2()
var movement = 0

func get_input():
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = velocity.x * speed
	


func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = jump_speed






#####
# Resources used.:

# Platform Character = https://kidscancode.org/godot_recipes/3.x/2d/platform_character/
