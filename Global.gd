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

enum SelectorType {
	DEFAULT,
	ALLOW,
	DISALLOW
}

# Super janky
var LEVELS: Array[Level] = [
	preload("res://Level/levels/Test.gd").new()
]

# Also super janky
var Action: Dictionary = {
	TEST = preload("res://Action/actions/Test.gd").new()
}
