extends Control

signal level_selected(level: Level)
signal back_initiated()

@onready var _level_container: Node = find_child("LevelContainer")
@onready var _vbox: Node = find_child("VBox")

const _button_scene = preload("res://UIButton/UIButton.tscn")

const MAX_GRID_SIZE: Vector2i = Vector2i(6,5)

var _list: Array[Level]
var _button_list: Array[UIButton]
var _hbox_list: Array[HBoxContainer]

func _ready() -> void:
	print(Levels.list.size())
	var rows: int = ceil(float(Levels.list.size()) / float(MAX_GRID_SIZE.x))
	_list.resize(Levels.list.size())
	_button_list.resize(Levels.list.size())
	_hbox_list.resize(rows)

	for i in range(rows):
		var hbox: HBoxContainer = HBoxContainer.new()
		_vbox.add_child(hbox)
		_hbox_list[i] = hbox
		hbox.set("theme_override_constants/separation", 32)

	for i in range(Levels.list.size()):
		var level: Level = Levels.list[i]
		var button: UIButton = _button_scene.instantiate()
		_hbox_list[floor(i / MAX_GRID_SIZE.x)].add_child(button)
		button.set_text(level.title)
		button.button_pressed.connect(_on_level_button_pressed)
		_button_list[i] = button

func _on_level_button_pressed(button: UIButton) -> void:
	print(button._label.get_text())
	var button_index: int = _button_list.find(button)
	if (button_index == -1): return
	var level_index = button_index
	var level = Levels.list[level_index]
	level_selected.emit(level)

func _on_back_button_pressed(button) -> void:
	back_initiated.emit()
