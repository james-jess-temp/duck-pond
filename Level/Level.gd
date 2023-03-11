class_name Level extends Object

var _title: String
var _theme: int
var _size: Vector2i
var _obstacles: Array[ObstaclePiece]
var _entities: Array[EntityPiece]

func _init(
	title: String,
	theme: int,
	size: Vector2i,
	obstacles: Array[ObstaclePiece],
	entities: Array[EntityPiece]
) -> void:
	_title = title
	_theme = theme
	_size = size
	_obstacles = obstacles
	_entities = entities

func get_theme() -> int:
	return _theme

func get_size() -> Vector2i:
	return _size

func get_obstacles() -> Array[ObstaclePiece]:
	return _obstacles

func get_entities() -> Array[EntityPiece]:
	return _entities

