extends KinematicBody2D

onready var stats = get_node("BulletStats")
var bullet_collision_info = null
var bullet_direction

signal bullet_hit(damage)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Hitbox.connect("area_entered", self, "_on_area_entered")
	if stats.destroy_on_impact:
			$Hitbox.connect("body_entered", self, "_on_area_entered")
			

func _physics_process(delta):
	move_and_collide(bullet_direction.normalized() * delta * stats.bullet_speed)
	

func _on_area_entered(_area):
	emit_signal("bullet_hit", stats.bullet_damage)
	queue_free()

