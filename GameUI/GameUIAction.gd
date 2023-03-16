extends Control

signal action_initiated(action: Action)

const _action_button_scene: PackedScene = preload("res://GameUI/GameUIActionButton.tscn")

@onready var _action_button_container: Control = find_child("ActionButtonContainer")

var _action_buttons: Array[GameUIActionButton]
var _action_button_active: Control


func load_actions(level_actions: Array[LevelAction]) -> void:
	reset()
	for i in range(level_actions.size()):
		var level_action: LevelAction = level_actions[i]
		var action_button: GameUIActionButton = _action_button_scene.instantiate()
		_action_button_container.add_child(action_button)
		action_button.set_action(level_action.action, level_action.uses)
		action_button.action_button_pressed.connect(_on_action_button_pressed)
		_action_buttons.push_back(action_button)

func use_current_action() -> void:
	_action_button_active.use_action()

func reset() -> void:
	_action_buttons = []
	for b in _action_button_container.get_children():
		_action_button_container.remove_child(b)
		b.queue_free()

func _on_action_button_pressed(action: Action, button: Control) -> void:
	_action_button_active = button
	action_initiated.emit(action)
