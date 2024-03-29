extends Node

@onready var rng: RandomNumberGenerator = RandomNumberGenerator.new()

const TILE_SIZE: Vector2i = Vector2i(64, 64)

enum Layer {
	BACKGROUND,
	DECORATION,
	OBSTACLE,
	ENTITY
}

enum LevelTheme {
	BASIC,
	ASIA,
	DESERT,
	SWAMP
}

enum SelectorType {
	DEFAULT,
	ALLOW,
	DISALLOW
}

# Also super janky
var Action: Dictionary = {
	TEST = preload("res://Action/actions/Test.gd").new(),
	STRAIGHT_1 = preload("res://Action/actions/Straight1.gd").new(),
	STRAIGHT_2 = preload("res://Action/actions/Straight2.gd").new(),
	STRAIGHT_3 = preload("res://Action/actions/Straight3.gd").new(),
	STRAIGHT_2_TURN_1 = preload("res://Action/actions/Straight2_Turn1.gd").new(),
	STRAIGHT_3_TURN_1 = preload("res://Action/actions/Straight3_Turn1.gd").new(),
}

const SCREEN_SIZE = Vector2i(1280, 720)
