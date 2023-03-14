class_name GameUI extends Control

signal action_initiated(action: Action)
signal reset_initiated()

@onready var _level: Control = find_child("GameUILevel")
@onready var _goal: Control = find_child("GameUIGoal")
@onready var _action: Control = find_child("GameUIAction")

func _ready() -> void:
	pass

func load_level_data(level: Level) -> void:
	_level.set_level(level.title)
	_goal.init_goals(level.goal_count)
	_action.load_actions(level.actions)

func action_finished() -> void:
	_action.use_current_action()

func goal_obtained() -> void:
	_goal.mark_goal()

func _on_action_initiated(action: Action) -> void:
	action_initiated.emit(action)

func _on_reset_initiated() -> void:
	reset_initiated.emit()
