extends CharacterBody2D

# Bullet properties
var speed: = 200

func _ready():
	pass  # Initialization code here

func _physics_process(delta):
	# Move the bullet
	var direction = Vector2.RIGHT.rotated(rotation)
	
	var collision: KinematicCollision2D = move_and_collide(direction * speed * delta)
	
	if collision == null:
		return
	
	queue_free()
