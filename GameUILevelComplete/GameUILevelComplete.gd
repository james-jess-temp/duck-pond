extends Control

signal home_initiated()
signal next_level_initiated()

func _on_home_button_pressed(button) -> void:
	home_initiated.emit()

func _on_next_button_pressed(button) -> void:
	next_level_initiated.emit()
