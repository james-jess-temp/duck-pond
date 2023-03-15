class_name BoardBackground extends Node2D

const TileMaps = {
	Global.LevelTheme.BASIC:  preload("res://BoardBackground/tilesets/BasicTileSet.tres"),
	Global.LevelTheme.ASIA:   preload("res://BoardBackground/tilesets/AsiaTileSet.tres"),
	Global.LevelTheme.DESERT: preload("res://BoardBackground/tilesets/DesertTileSet.tres")
}

@onready var _tilemap: TileMap = $TileMap

const COVER_MIN: Vector2i = Vector2i(-15, -10)
const COVER_MAX: Vector2i = Vector2i(15, 10)

func _ready() -> void:
	scale = Vector2(0.25, 0.25)

func draw_background(size: Vector2i, theme: int = Global.LevelTheme.BASIC) -> void:
	var tilemap = TileMaps[theme]
	_tilemap.set_tileset(tilemap)

	var cover_cells: Array[Vector2i]
	var cover_size: Vector2i = COVER_MAX - COVER_MIN
	cover_cells.resize(cover_size.x * cover_size.y)
	for x in range(cover_size.x):
		for y in range(cover_size.y):
			cover_cells[(x * cover_size.y) + y] = Vector2i(x + COVER_MIN.x, y + COVER_MIN.y)
	_tilemap.set_cells_terrain_connect(0, cover_cells, 0, 1)

	var cells: Array[Vector2i]
	cells.resize(size.x * size.y)
	for x in range(size.x):
		for y in range(size.y):
			cells[(x * size.y) + y] = Vector2i(x, y)

	_tilemap.set_cells_terrain_connect(0, cells, 0, 0)

