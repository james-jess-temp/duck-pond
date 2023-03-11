extends Level

func _init() -> void:
	title = "Test Level"
	theme = Global.LevelTheme.BASIC
	size = Vector2i(10, 10)
	pieces = [
		LevelPiece.new(Piece.Obstacle.DEFAULT, 0, 0),
		LevelPiece.new(Piece.Obstacle.DEFAULT, 1, 2),
		LevelPiece.new(Piece.Entity.DEFAULT, 2, 4)
	]
