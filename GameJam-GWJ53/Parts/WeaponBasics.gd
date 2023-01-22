extends Area2D


onready var timershoot = get_node("ShootTimer")
onready var fired = get_node("Fired")


onready var value = 0
onready var shoot_flag = false
onready var is_shooting = false


var weapons = [
	"res://Parts/Weapon/Weapon0.tscn",
	"res://Parts/Weapon/Weapon1.tscn",
	"res://Parts/Weapon/Weapon2.tscn",
	"res://Parts/Weapon/Weapon3.tscn",
	"res://Parts/Weapon/Weapon4.tscn",
	"res://Parts/Weapon/Weapon5.tscn",
]


var stats
var weapon

export var size = 0 setget , get_part_size


signal gun_fired()
signal heat_increased(heat_caused)


func _ready():
	size = len(weapons) - 1
	

func load_weapon(value):
	weapon = load(weapons[value]).instance()
	get_parent().call_deferred("add_child", weapon)
	weapon.position = self.position
	stats = weapon.get_node("WeaponStats")
	
	
# Today is friday in california
func shoot(left_right):
	emit_signal("gun_fired")
	if GlobalVariables.sounds_allowed:
		fired.play()
	is_shooting = true
	timershoot.start(stats.shoot_delay)
	var bullet = stats.bullet_used.instance()
	get_tree().get_root().call_deferred("add_child", bullet)
	bullet.position = weapon.bulletorigin.global_position 
	bullet.bullet_direction = weapon.bulletorigin.global_position - weapon.global_position
	if left_right:
		bullet.scale.x = scale.y * 1
	else:
		bullet.scale.x = scale.y * -1
		
		
func _on_ShootTimer_timeout():
	is_shooting = false


func get_part_size():
	return size
	
