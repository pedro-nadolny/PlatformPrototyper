extends CharacterBody2D

# Bullet properties
var speed: = 750
var bullet_explosion = preload("res://scenes/bullet_explosion.tscn")

func _ready():
	pass  # Initialization code here

func _physics_process(delta):
	# Move the bullet
	var direction = Vector2.RIGHT.rotated(rotation)
	var collision: KinematicCollision2D = move_and_collide(direction * speed * delta)
	
	if collision == null:
		return
	
	var explosion: Node2D = bullet_explosion.instantiate()
	explosion.rotation = rotation + deg_to_rad(-90)
	explosion.position = position
	add_sibling(explosion)

	queue_free()
