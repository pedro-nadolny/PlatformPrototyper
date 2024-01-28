extends Area2D

var max_velocity = 1000
var max_distance: float

func _ready():
	max_distance = get_node("CollisionShape2D").shape.radius

func _physics_process(_delta):
	call_deferred("queue_free")
	var bodies = get_overlapping_bodies()
	
	if bodies.is_empty():
		return
		
	var body: CharacterBody2D = bodies[0]
	
	var distance: float = body.global_position.distance_to(global_position)
	if distance > max_distance:
		return
	
	var direction: Vector2 = global_position.direction_to(body.global_position)
	var impulse_power = max_velocity * (1 - distance / max_distance)
	
	body.apply_impulse(direction * impulse_power)

