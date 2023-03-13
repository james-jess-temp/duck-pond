class_name GameUIActionButton extends Control

signal action_button_pressed(action: Action, button: Control)

@onready var _button: TextureButton = find_child("Button")
@onready var _button_icon: TextureRect = find_child("ButtonIcon")
@onready var _button_label: Label = find_child("ButtonLabel")

var _action: Action
var _action_uses: int

func _update_action_uses_label() -> void:
	_button_label.set_text("x" + str(_action_uses))

func set_action(action: Action, action_uses: int) -> void:
	_action = action
	_action_uses = action_uses
	_button.set_disabled(false)
	_button_icon.set_texture(action.get_icon())
	_update_action_uses_label()

func use_action() -> void:
	_action_uses -= 1
	_update_action_uses_label()
	if (_action_uses <= 0):
		_button.set_disabled(true)

func _on_button_pressed() -> void:
	# TODO: Disabled check
	action_button_pressed.emit(_action, self)
	print("Initiated action")

