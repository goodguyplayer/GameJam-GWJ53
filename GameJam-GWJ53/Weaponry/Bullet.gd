extends KinematicBody2D

export var bullet_direction = Vector2.ZERO
export var bullet_speed = 0

var bullet_collision_info = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if bullet_speed == 0:
		queue_free()
	bullet_collision_info = move_and_collide(bullet_direction.normalized() * delta * bullet_speed)
	

func _on_Hurtbox_area_entered(area):
	queue_free()
