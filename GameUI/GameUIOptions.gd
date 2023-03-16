extends Control

signal home_button_pressed()
signal reset_button_pressed()

const Sound = {
	HOVER = preload("res://_assets/Audio/stick_click.wav"),
	PRESS = preload("res://_assets/Audio/stick_thump.wav"),
	PRESS_RESET = preload("res://_assets/Audio/ding.wav")
}

@onready var _audio_player: AudioStreamPlayer = $AudioPlayer
@onready var _home_button: TextureButton = find_child("HomeButton")
@onready var _reset_button: TextureButton = find_child("ResetButton")

func _on_home_button_pressed() -> void:
	home_button_pressed.emit()
	_audio_player.set_stream(Sound.PRESS)
	_audio_player.play()

func _on_reset_button_pressed() -> void:
	reset_button_pressed.emit()
	_audio_player.set_stream(Sound.PRESS_RESET)
	_audio_player.play()


func _on_button_hover() -> void:
	_audio_player.set_stream(Sound.HOVER)
	_audio_player.play()
