extends KinematicBody2D

#####
# Resources used.:

# Platform Character = https://kidscancode.org/godot_recipes/3.x/2d/platform_character/
# General details (Collision, layers, related) = https://www.youtube.com/playlist?list=PL9FzW-m48fn2SlrW0KoLT4n5egNdX-W9a

#####

export var bulletscene = preload("res://Weaponry/Bullet.tscn")


export (int) var speed = 400
export (int) var gravity = 800
export (int) var jump_speed = -400

# -500 -- 2 blocks
# -400 -- 1 block

onready var facing = get_node("Facing")
onready var bulletorigin = get_node("BulletOrigin")
onready var timershoot = get_node("TimerShoot")
onready var playerstats = get_node("PlayerStats")
onready var head = get_node("Head")
onready var torso = get_node("Torso")
onready var legs = get_node("Legs")


var velocity = Vector2()
var movement = 0
var shoot_flag = false
var is_shooting = false
var shootdelay = 0.5


func _ready():
	playerstats.connect("no_health", self, "queue_free")
	head.load_head(0)
	torso.load_torso(0)
	legs.load_legs(0)
	set_health()
	set_heat()
	
	
func set_health():
	var total_health = head.stats.max_health + torso.stats.max_health + legs.stats.max_health
	playerstats.set_max_health(total_health)


func set_heat():
	var total_heat = head.stats.max_heat_capacity + torso.stats.max_heat_capacity + legs.stats.max_heat_capacity
	playerstats.set_max_heat(total_heat)
	

func get_input(delta):
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = velocity.x * speed
	if Input.is_action_pressed("ui_shoot"):
		shoot_flag = true
	else:
		shoot_flag = false
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = jump_speed


func _physics_process(delta):
	get_input(delta)
	if velocity.x > 0:
		bulletorigin.position = Vector2( 64, 0)
	elif velocity.x < 0:
		bulletorigin.position = Vector2( -64, 0)
	
	if shoot_flag and not is_shooting:
		is_shooting = true
		timershoot.start(shootdelay)
		shoot()


func shoot():
	var bullet = bulletscene.instance()
	get_parent().call_deferred("add_child", bullet)
	bullet.destroy_on_impact = false
	bullet.position = bulletorigin.global_position 
	bullet.bullet_direction = bulletorigin.global_position - global_position
	bullet.bullet_speed = 1000
	

# Redo - Head, Torso, Legs hurtbox
#func _on_Hurtbox_area_entered(area):
#	playerstats.max_health -= 1


func _on_TimerShoot_timeout():
	is_shooting = false
