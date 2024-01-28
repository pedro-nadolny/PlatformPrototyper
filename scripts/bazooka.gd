extends Sprite2D

@onready var player: Node2D = %Player
@onready var world: Node2D = $/root/World
@onready var bulletSpawn: Node2D = %BulletSpawn
const BAZOOKA_OFFSET = Vector2(-15, -7.5)

var bulletScene = preload("res://entities/bullet.tscn")

func _ready():
	pass
	
func _process(_delta):
	track_player_position()
	track_aim_at_mouse()
	
	if Input.is_action_just_pressed("fire"):
		fire_bullet()

func track_player_position():
	position = player.position + BAZOOKA_OFFSET
	
func track_aim_at_mouse():
	var vector = get_global_mouse_position() - position
	rotation = vector.angle()

func fire_bullet():
	var bullet = bulletScene.instantiate()
	bullet.rotation = bulletSpawn.global_rotation
	bullet.position = bulletSpawn.global_position
	world.add_child(bullet)
