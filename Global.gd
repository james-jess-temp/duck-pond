extends Node

const TILE_SIZE: Vector2i = Vector2i(64, 64)

enum Layer {
	BACKGROUND,
	DECORATION,
	OBSTACLE,
	ENTITY
}

enum LevelTheme {
	BASIC,
	SWAMP,
	SAHARA
}

# Super janky
var LEVELS: Array[Level] = [
	preload("res://Level/levels/Test.gd").new()
]
