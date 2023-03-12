extends Level

func _init() -> void:
	title = "Test Level"
	theme = Global.LevelTheme.BASIC
	size = Vector2i(10, 10)
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 1, 1),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 1, 1),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 1, 2),
	]
