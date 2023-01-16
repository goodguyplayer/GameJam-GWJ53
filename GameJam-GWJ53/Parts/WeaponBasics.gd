extends Area2D


onready var timershoot = get_node("ShootTimer")


onready var value = 0
onready var shoot_flag = false
onready var is_shooting = false


var weapons = [
	"res://Parts/Weapon/Weapon0.tscn",
	"res://Parts/Weapon/Weapon1.tscn",
]


var stats
var weapon


signal gun_fired()
signal heat_increased(heat_caused)


func _ready():
	pass
	

func load_weapon(value):
	weapon = load(weapons[value]).instance()
	get_parent().call_deferred("add_child", weapon)
	weapon.position = self.position
	stats = weapon.get_node("WeaponStats")
	
	
# Today is friday in california
func shoot():
	emit_signal("gun_fired")
	is_shooting = true
	timershoot.start(stats.shoot_delay)
	var bullet = stats.bullet_used.instance()
	get_tree().get_root().call_deferred("add_child", bullet)
	bullet.position = weapon.bulletorigin.global_position 
	bullet.bullet_direction = weapon.bulletorigin.global_position - weapon.global_position
		
		
func _on_ShootTimer_timeout():
	is_shooting = false
