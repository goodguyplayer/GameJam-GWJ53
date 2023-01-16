extends KinematicBody2D

#####
# Resources used.:

# Platform Character = https://kidscancode.org/godot_recipes/3.x/2d/platform_character/
# General details (Collision, layers, related) = https://www.youtube.com/playlist?list=PL9FzW-m48fn2SlrW0KoLT4n5egNdX-W9a
# Getting root node instead of parent node = https://godotengine.org/qa/58717/getting-the-root-node-from-anywhere
# Flipping player and all the children = https://godotengine.org/qa/62229/flipping-the-player-including-damage-colliders
## https://godotengine.org/qa/3953/want-flip-character-the-horizontal-axis-but-whats-the-best-way

#####


export (int) var speed = 400
export (int) var gravity = 800
export (int) var jump_speed = -400
export (int) var head_option = 0
export (int) var torso_option = 0
export (int) var legs_option = 0
export (int) var weapon_option = 0

# -500 -- 2 blocks
# -400 -- 1 block

onready var playerstats = get_node("PlayerStats")
onready var head = get_node("Head")
onready var torso = get_node("Torso")
onready var legs = get_node("Legs")
onready var weapon = get_node("Weapon")


var velocity = Vector2()
var movement = 0
var shoot_flag = false
var is_shooting = false
var shootdelay = 0.5


func _ready():
	playerstats.connect("no_health", self, "queue_free")
	head.load_head(head_option)
	torso.load_torso(torso_option)
	legs.load_legs(legs_option)
	weapon.load_weapon(weapon_option)
	set_health()
	set_heat()
	head.connect("limb_hit", self, "_on_limb_hit")
	torso.connect("limb_hit", self, "_on_limb_hit")
	legs.connect("limb_hit", self, "_on_limb_hit")
	
	
func set_health():
	var total_health = head.stats.max_health + torso.stats.max_health + legs.stats.max_health
	playerstats.set_max_health(total_health)
	playerstats.health = total_health


func set_heat():
	var total_heat = head.stats.max_heat_capacity + torso.stats.max_heat_capacity + legs.stats.max_heat_capacity
	playerstats.set_max_heat(total_heat)
	playerstats.heat = 0
	

func get_input(delta):
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = velocity.x * speed
	if Input.is_action_pressed("ui_shoot") and not weapon.is_shooting:
		weapon.shoot()
		
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = jump_speed
			

func _physics_process(delta):
	get_input(delta)
	if velocity.x > 0:
		scale.x = scale.y * 1
	elif velocity.x < 0:
		scale.x = scale.y * -1
		

func _on_limb_hit():
	playerstats.health -= 10
