extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = 400.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var external_impulse = Vector2.ZERO
var last_applied_ext_impulse = Vector2.ZERO

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED + last_applied_ext_impulse.x
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * 5 * delta)
		
	if is_on_floor():
		external_impulse.x = move_toward(external_impulse.x, 0, SPEED * 5 * delta)
				
	velocity += external_impulse - last_applied_ext_impulse
	last_applied_ext_impulse = external_impulse	
	
	print(velocity, last_applied_ext_impulse)
	
	move_and_slide()
		
func apply_impulse(impulse: Vector2):
	external_impulse += impulse
