class_name Piece extends Node2D

@onready var _sprite = $Sprite

var _grid_position: Vector2i

func _init() -> void:
	_grid_position = Vector2i(0,0)

func _ready() -> void:
	pass

func get_grid_position() -> Vector2i:
	return _grid_position

func set_grid_position(pos: Vector2i) -> void:
	_grid_position = pos
