extends Area2D


onready var timershoot = get_node("ShootTimer")


onready var value = 0
onready var shoot_flag = false
onready var is_shooting = false


var weapons = [
	"res://Parts/Weapon/Weapon0.tscn",
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
	

func shoot():
	if not is_shooting:
		emit_signal("gun_fired")
		is_shooting = true
		timershoot.start(stats.shoot_delay)
		var bullet = stats.bullet_used.instance()
		get_parent().call_deferred("add_child", bullet)
		bullet.position = weapon.bulletorigin.global_position 
		bullet.bullet_direction = weapon.global_position - global_position
		
		
func _on_ShootTimer_timeout():
	is_shooting = false
