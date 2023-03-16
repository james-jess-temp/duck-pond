class_name Duck extends EntityPiece

const Sound = {
	MOVE = preload("res://_assets/Audio/water_drop.wav"),
	STOP = preload("res://_assets/Audio/quack.wav")
}

@onready var _bubble_particles: CPUParticles2D = $BubbleParticle

func _on_move(from: Vector2i, to: Vector2i) -> void:
	if (!_sprite): return

	var dominant_direction: Vector2i = _calc_dominant_direction(from, to)
	if (dominant_direction.x != 0): # Moving horizontally
		_sprite.set_animation("moving_side")
	else: # Moving vertically
		if (dominant_direction.y > 0):
			_sprite.set_animation("idle_front") # Using idle for moving
		else:
			_sprite.set_animation("moving_back")

	if (from.x > to.x):
		_sprite.flip_h = true
	else:
		_sprite.flip_h = false

	_bubble_particles.set_emitting(true)
	_audio_player.set_stream(Sound.MOVE)
	_audio_player.play()

func _on_move_finished() -> void:
	var current_animation: String = _sprite.get_animation()
	if (current_animation == "moving_side"):
		_sprite.set_animation("idle_side")
	elif (current_animation == "idle_front"):
		_sprite.set_animation("idle_front") # Using idle for moving
	elif (current_animation == "moving_back"):
		_sprite.set_animation("idle_back")

	_bubble_particles.set_emitting(false)
	_audio_player.set_stream(Sound.STOP)
	_audio_player.play()
