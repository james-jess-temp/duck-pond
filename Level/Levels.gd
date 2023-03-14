extends Node

var TEST = preload("res://Level/levels/Test.gd").new()
var LEVEL1_1 = preload("res://Level/levels/Level1_1.gd").new()
var LEVEL1_2 = preload("res://Level/levels/Level1_2.gd").new()
var LEVEL1_9 = preload("res://Level/levels/Level1_9.gd").new()
var LEVEL1_10 = preload("res://Level/levels/Level1_9.gd").new()

var list: Array[Level] = [
	LEVEL1_1,
	LEVEL1_2,
	LEVEL1_9,
	LEVEL1_10,
]
