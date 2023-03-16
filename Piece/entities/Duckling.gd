class_name Duckling extends EntityPiece

const Sound = {
	DUCK_GET = preload("res://_assets/Audio/duck_cartoony.wav")
}

@onready var _heart_particles: CPUParticles2D = $HeartParticles

func enable_particles(enable: bool) -> void:
	_heart_particles.set_emitting(enable)
	_audio_player.set_stream(Sound.DUCK_GET)
	_audio_player.play()
