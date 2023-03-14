class_name Duckling extends EntityPiece

@onready var _heart_particles: CPUParticles2D = $HeartParticles

func enable_particles(enable: bool) -> void:
	_heart_particles.set_emitting(enable)
