class_name UIButton extends Control

signal button_pressed(button: UIButton)

const Sound = {
	HOVER = preload("res://_assets/Audio/stick_click.wav"),
	PRESS = preload("res://_assets/Audio/stick_thump.wav")
}

@onready var _label: Label = find_child("Text")
@onready var _audio_player: AudioStreamPlayer = $AudioPlayer
@export var text: String = "Text"



func _ready() -> void:
	set_text(text)

func set_text(s: String) -> void:
	_label.set_text(s)

func _on_button_pressed() -> void:
	button_pressed.emit(self)
	_audio_player.set_stream(Sound.PRESS)
	_audio_player.play()

func _on_hover() -> void:
	_audio_player.set_stream(Sound.HOVER)
	_audio_player.play()
