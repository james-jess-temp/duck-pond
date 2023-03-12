extends Node

@onready var board = $Game/Board

func _ready() -> void:
	board.load_level(Global.LEVELS[0])
	board.mark_traversable_tiles(Global.Action.TEST)

