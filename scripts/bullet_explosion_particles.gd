extends GPUParticles2D

func _ready():
	emitting = true

func _on_finished():
	get_parent().queue_free()
