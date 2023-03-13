extends Control

signal level_changed()

@onready var _label: Label = find_child("Label")

func set_level(s: String):
	_label.set_text(s)
	level_changed.emit()
