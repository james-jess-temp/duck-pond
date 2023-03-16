extends Level

func _init() -> void:
	title = "1-3"
	theme = Global.LevelTheme.BASIC
	size = Vector2i(5, 8)
	goal_count = 2
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 1, 1),
		LevelPiece.new(Piece.Entity.DUCKLING, 3, 6),
		LevelPiece.new(Piece.Entity.DUCKLING, 2, 3),
		LevelPiece.new(Piece.Obstacle.LOG_1, 2, 2),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 3, 4),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 1, 4),
		LevelPiece.new(Piece.Obstacle.LOG_1, 2, 5),
	]
	actions = [
		LevelAction.new(Global.Action.STRAIGHT_2_TURN_1, 3),
	]
