extends KinematicBody2D


onready var timerturn = get_node("TimerTurn")
onready var enemystats = get_node("EnemyStats")
onready var head = get_node("Head")
onready var torso = get_node("Torso")
onready var legs = get_node("Legs")
onready var weapon = get_node("Weapon")


export (int) var head_option = 0
export (int) var torso_option = 0
export (int) var legs_option = 0
export (int) var weapon_option = 0


export (float) var turndelay = 3


var left_right : bool = true # Right - True, left - False
var is_shooting : bool = false 


func _ready():
	enemystats.connect("no_health", self, "queue_free")
	head.load_head(head_option)
	torso.load_torso(torso_option)
	legs.load_legs(legs_option)
	weapon.load_weapon(weapon_option)
	timerturn.start(turndelay)
	timerturn.connect("timeout", self, "_on_timeout_turn")
	head.connect("limb_hit", self, "_on_limb_hit")
	torso.connect("limb_hit", self, "_on_limb_hit")
	legs.connect("limb_hit", self, "_on_limb_hit")
	

func _physics_process(delta):
	pass
	
	
func _on_timeout_turn():
	if left_right:
		scale.x = scale.y * 1
	else:
		scale.x = scale.y * -1
	left_right = not left_right
	

func _on_TriggerboxEye_body_entered(body):
	if body.name == "Player" and not weapon.is_shooting:
		weapon.shoot(left_right)


func _on_limb_hit():
	enemystats.health -= 10
	
	
