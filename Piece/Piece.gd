class_name Piece extends Node2D

@onready var _sprite = $Sprite

var _grid_position: Vector2i

func _init() -> void:
	_grid_position = Vector2i(0,0)

func _ready() -> void:
	pass

func _calc_dominant_direction(from: Vector2i, to: Vector2i):
	var diff: Vector2i = to - from
	if (abs(diff.x) >= abs(diff.y)):
		return Vector2i(diff.x, 0)
	else:
		return Vector2i(0, diff.y)

func get_grid_position() -> Vector2i:
	return _grid_position

func set_grid_position(pos: Vector2i) -> void:
	_on_move(_grid_position, pos)
	_grid_position = pos

# OVERRIDABLE
func _on_move(from: Vector2i, to: Vector2i) -> void:
	pass
