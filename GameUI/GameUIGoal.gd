extends Control

const _icon_scene: PackedScene = preload("res://GameUI/GameUIGoalIcon.tscn")

@onready var _icon_container = find_child("IconContainer")

var _icons: Array[GameUIGoalIcon]

func init_goals(n: int) -> void:
	reset()
	_icons.resize(n)
	for i in range(n):
		var icon: GameUIGoalIcon = _icon_scene.instantiate()
		_icons[i] = icon
		_icon_container.add_child(icon)

func mark_goal():
	var icon = _icons.pop_front()
	icon.set_enabled(false)

func reset():
	_icons = []
	for i in _icon_container.get_children():
		_icon_container.remove_child(i)
		i.queue_free()
