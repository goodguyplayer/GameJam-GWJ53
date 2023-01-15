extends KinematicBody2D

onready var stats = get_node("BulletStats")
var bullet_collision_info = null
var bullet_direction

signal bullet_hit(damage)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	if stats.bullet_speed == 0:
		queue_free()
	bullet_collision_info = move_and_collide(bullet_direction.normalized() * delta * stats.bullet_speed)
	if bullet_collision_info != null and stats.destroy_on_impact:
		emit_signal("bullet_hit", stats.bullet_damage)
		queue_free()
