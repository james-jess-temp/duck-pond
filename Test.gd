extends Node

@onready var board = $Game/Camera/Board

func _ready() -> void:
	board.load_level(Levels.LEVEL1_9)

