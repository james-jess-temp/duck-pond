extends Control

signal home_button_pressed()
signal reset_button_pressed()

@onready var _home_button: TextureButton = find_child("HomeButton")
@onready var _reset_button: TextureButton = find_child("ResetButton")

func _on_home_button_pressed() -> void:
	home_button_pressed.emit()

func _on_reset_button_pressed() -> void:
	reset_button_pressed.emit()
