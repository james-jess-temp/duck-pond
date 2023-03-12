class_name BoardSelectorTile extends Node2D

signal clicked(pos, type)

@onready var _sprite: Sprite2D = $Sprite
@onready var _interact_area: Area2D = $InteractArea

const Sprite = {
#	Global.SelectorType.DEFAULT: preload("res://_assets/BoardSelectorTile/_default.png"),
Global.SelectorType.DEFAULT: null,
	Global.SelectorType.ALLOW: preload("res://_assets/BoardSelectorTile/allowed/_default.png"),
	Global.SelectorType.DISALLOW: preload("res://_assets/BoardSelectorTile/disallowed/_default.png")
}

var _type: int
var _grid_position: Vector2i

func _ready() -> void:
	_grid_position = Vector2i(-1, -1)
	_type = -1

func _set_sprite(type: int):
	_sprite.set_texture(Sprite[type])

func set_grid_position(grid_position: Vector2i) -> void:
	_type = Global.SelectorType.DEFAULT
	_grid_position = grid_position

func set_type(type: int) -> void:
	_type = type
	_set_sprite(type)

func _on_interact_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed):
		clicked.emit(_grid_position, _type)
		print(_grid_position)
