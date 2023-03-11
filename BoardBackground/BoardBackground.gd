class_name BoardBackground extends Node2D

@onready var _tilemap: TileMap = $TileMap

func _ready() -> void:
	_tilemap.scale = Vector2(0.5, 0.5)

func draw_background(size: Vector2i) -> void:
	_tilemap.

