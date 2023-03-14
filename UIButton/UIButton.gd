class_name UIButton extends Control

signal button_pressed(button: UIButton)

@export var text: String = "Text"

@onready var _label: Label = find_child("Text")

func _ready() -> void:
	set_text(text)

func set_text(s: String) -> void:
	_label.set_text(s)

func _on_button_pressed() -> void:
	button_pressed.emit(self)
