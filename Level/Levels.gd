extends Node

var TEST = preload("res://Level/levels/Test.gd").new()
var LEVEL1_1 = preload("res://Level/levels/Level1_1.gd").new()
var LEVEL1_2 = preload("res://Level/levels/Level1_2.gd").new()
var LEVEL1_3 = preload("res://Level/levels/Level1_3.gd").new()
var LEVEL1_4 = preload("res://Level/levels/Level1_4.gd").new()
var LEVEL1_5 = preload("res://Level/levels/Level1_5.gd").new()
var LEVEL2_1 = preload("res://Level/levels/Level2_1.gd").new()
var LEVEL2_2 = preload("res://Level/levels/Level2_2.gd").new()
var LEVEL2_3 = preload("res://Level/levels/Level2_3.gd").new()
var LEVEL2_4 = preload("res://Level/levels/Level2_4.gd").new()
var LEVEL2_5 = preload("res://Level/levels/Level2_5.gd").new()
var LEVEL3_1 = preload("res://Level/levels/Level3_1.gd").new()
var LEVEL3_2 = preload("res://Level/levels/Level3_2.gd").new()
var LEVEL3_3 = preload("res://Level/levels/Level3_3.gd").new()
var LEVEL3_4 = preload("res://Level/levels/Level3_4.gd").new()
var LEVEL3_5 = preload("res://Level/levels/Level3_5.gd").new()

var list: Array[Level] = [
	LEVEL1_1,
	LEVEL1_2,
	LEVEL1_3,
	LEVEL1_4,
	LEVEL1_5,

	LEVEL2_1,
	LEVEL2_2,
	LEVEL2_3,
	LEVEL2_4,
	LEVEL2_5,

	LEVEL3_1,
	LEVEL3_2,
	LEVEL3_3,
	LEVEL3_4,
	LEVEL3_5,

	TEST,
]
