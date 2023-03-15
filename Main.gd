extends Node

const Screen = {
	Title = preload("res://TitleScreen/TitleScreen.tscn"),
	LevelSelect = preload("res://LevelSelectScreen/LevelSelectScreen.tscn"),
	Game = preload("res://Game/Game.tscn")
}

@onready var _screen_container: Node = $ScreenContainer

var _current_screen: Node = null
var _previous_screen: Node = null

func _ready() -> void:
	_switch_to_title_screen()

func _switch_screen(screen_scene: PackedScene) -> void:
	var screen = screen_scene.instantiate()
	_screen_container.add_child(screen)
	_screen_container.move_child(screen, 0)

	var y_movement = Global.SCREEN_SIZE.y
	if (screen_scene == Screen.Title): y_movement *= -1

	if (_current_screen != null):
		var old_screen_tweener: Tween = create_tween()
		old_screen_tweener.tween_property(_current_screen, "position", Vector2(0, y_movement), .5
			).as_relative(
			).set_trans(Tween.TRANS_SINE
			).set_ease(Tween.EASE_IN)
		old_screen_tweener.finished.connect(_remove_previous_screen)

	var new_screen_tweener: Tween = create_tween()
	new_screen_tweener.tween_property(screen, "position", Vector2(0, y_movement), .5
		).as_relative(
		).from(Vector2(0, -y_movement)
		).set_trans(Tween.TRANS_SINE
		).set_ease(Tween.EASE_IN)

	#if (_current_screen != null):
	#
	_previous_screen = _current_screen
	_current_screen = screen

func _switch_to_title_screen() -> void:
	_switch_screen(Screen.Title)
	_current_screen.play_initiated.connect(_switch_to_level_select_screen)

func _switch_to_level_select_screen() -> void:
	_switch_screen(Screen.LevelSelect)
	_current_screen.level_selected.connect(_switch_to_game)
	_current_screen.back_initiated.connect(_switch_to_title_screen)

func _switch_to_game(level: Level) -> void:
	_switch_screen(Screen.Game)
	_current_screen.load_level(level)
	_current_screen.back_initiated.connect(_switch_to_level_select_screen)

func _remove_previous_screen() -> void:
	if (_previous_screen != null):
		_screen_container.remove_child(_previous_screen)
		_previous_screen = null
