class_name BoardBackground extends Node2D

@onready var _tilemap: TileMap = $TileMap

func _ready() -> void:
	scale = Vector2(0.25, 0.25)

func draw_background(size: Vector2i) -> void:
	var cells: Array[Vector2i]
	cells.resize(size.x * size.y)
	for x in range(size.x):
		for y in range(size.y):
			cells[(x * size.y) + y] = Vector2i(x, y)

	_tilemap.set_cells_terrain_connect(0, cells, 0, 0)

