extends Node2D

@onready var board = $Board
var _entity = preload("res://Piece/EntityPiece.tscn")
var _obstacle = preload("res://Piece/ObstaclePiece.tscn")

func _ready() -> void:
	var grid = BoardGrid.new(Vector2i(9, 9))
	board.load_grid(grid)
	var p1 = _entity.instantiate()
	var o1 = _obstacle.instantiate()
	var o2 = _obstacle.instantiate()
	var o3 = _obstacle.instantiate()
	var o4 = _obstacle.instantiate()
	var o5 = _obstacle.instantiate()
	grid.add_piece(p1, Vector2i(0, 0))
	grid.add_piece(o1, Vector2i(7, 8))
	grid.add_piece(o2, Vector2i(6, 8))
	grid.add_piece(o3, Vector2i(5, 8))
	grid.add_piece(o4, Vector2i(4, 8))
	grid.add_piece(o5, Vector2i(3, 8))
	grid.move_piece(p1, Vector2i(3, 8))
