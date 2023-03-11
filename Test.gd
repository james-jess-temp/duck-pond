extends Node2D

@onready var board = $Board

func _ready() -> void:
	board.load_level(Global.LEVELS[0])

