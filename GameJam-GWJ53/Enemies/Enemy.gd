extends KinematicBody2D


export (float) var turndelay = 3
export (float) var shootdelay = 1.5
export var bulletscene = preload("res://Parts/Bullets/Bullet0.tscn")


onready var timerturn = get_node("TimerTurn")
onready var timershoot = get_node("TimerTurn")
onready var facing = get_node("Facing")
onready var bulletorigin = get_node("BulletOrigin")


var left_right : bool = true # Right - True, left - False
var is_shooting : bool = false 


func _ready():
	timerturn.start(turndelay)
	timerturn.connect("timeout", self, "_on_timeout_turn")
	timershoot.connect("timeout", self, "_on_timeout_shoot")
	

func _physics_process(delta):
	pass
	
	
func _on_timeout_turn():
	facing.position = Vector2( -facing.position.x, 0)
	bulletorigin.position = Vector2( -bulletorigin.position.x, 0)
	facing.rotation_degrees += 180
	left_right = not left_right
	

func _on_timeout_shoot():
	is_shooting = false


func _on_TriggerboxEye_body_entered(body):
	if body.name == "Player" and not is_shooting:
		is_shooting = true
		timershoot.start(shootdelay)
		shoot()


func shoot():
	var bullet = bulletscene.instance()
	get_parent().call_deferred("add_child", bullet)
	bullet.position = bulletorigin.global_position 
	bullet.bullet_direction = bulletorigin.global_position - global_position
	

func _on_Hurtbox_area_entered(area):
	queue_free()
