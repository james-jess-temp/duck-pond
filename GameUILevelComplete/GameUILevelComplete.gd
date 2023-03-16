extends Control

signal home_initiated()
signal next_level_initiated()

const Sound = {
	VICTORY = preload("res://_assets/Audio/banjo_jingle.wav")
}

@onready var _audio_player: AudioStreamPlayer = $AudioPlayer

func set_enabled(enable: bool):
	if (enable):
		_audio_player.set_stream(Sound.VICTORY)
		_audio_player.play()
		self.set_visible(true)
	else:
		self.set_visible(false)

func _on_home_button_pressed(button) -> void:
	home_initiated.emit()

func _on_next_button_pressed(button) -> void:
	next_level_initiated.emit()
