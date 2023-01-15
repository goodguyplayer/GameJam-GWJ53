extends Sprite


onready var stats = get_node("WeaponStats")
onready var bulletorigin = get_node("BulletOrigin")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Today is friday in california
func shoot():
	var bullet = stats.bullet_used.instance()
	get_parent().call_deferred("add_child", bullet)
	bullet.position = bulletorigin.global_position 
	bullet.bullet_direction = bulletorigin.global_position - global_position
