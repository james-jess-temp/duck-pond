class_name Action extends Object

var _moves: Array[Vector2i] # This is relative to where the player is

func _init(moves: Array[Vector2i]) -> void:
	_moves = moves

func get_moves() -> Array[Vector2i]:
	return _moves
