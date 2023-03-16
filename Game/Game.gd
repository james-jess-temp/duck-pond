extends Control

signal back_initiated()
signal next_level_initiated()

@onready var _camera: Node = find_child("Camera")
@onready var _board: Node = find_child("Board")
@onready var _ui: Node = find_child("GameUI")
@onready var _level_complete_popup: Node = find_child("GameUILevelComplete")

var _current_level: Level

func _ready() -> void:
	_level_complete_popup.set_enabled(false)
	var tweener: Tween = create_tween()
	tweener.tween_property(self, "modulate", Color(1,1,1,1), 1).from(Color(1,1,1,0))

func load_level(level: Level):
	_board.load_level(level)
	_current_level = level

func _on_action_initiated(action: Action) -> void:
	_board.mark_traversable_tiles(action)

func _on_level_loaded(level: Level) -> void:
	_ui.load_level_data(level)

func _on_action_finished() -> void:
	_ui.action_finished()

func _on_reset_initiated() -> void:
	_board.reset()

func _on_goal_obtained() -> void:
	_ui.goal_obtained()

func _on_level_complete() -> void:
	_level_complete_popup.set_enabled(true)

func _on_home_initiated() -> void:
	back_initiated.emit()

func _on_next_level_initiated() -> void:
	var current_level_index: int = Levels.list.find(_current_level)
	if (current_level_index >= Levels.list.size() - 1 - 1): # Remove last TEST level
		back_initiated.emit()
		return

	var next_level = Levels.list[current_level_index + 1]
	_current_level = next_level
	load_level(next_level)
	_level_complete_popup.set_enabled(false)
	next_level_initiated.emit()
