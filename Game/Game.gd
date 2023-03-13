extends Node

@onready var _camera: Node = $Camera
@onready var _board: Node = $Camera/Board
@onready var _ui: Node = $GameUI


func _on_action_initiated(action: Action) -> void:
	_board.mark_traversable_tiles(action)


func _on_level_loaded(level: Level) -> void:
	_ui.load_level_data(level)


func _on_action_finished() -> void:
	_ui.action_finished()

func _on_reset_initiated() -> void:
	_board.reset()
