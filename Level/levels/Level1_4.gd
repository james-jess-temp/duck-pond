extends Level

func _init() -> void:
	title = "1-4"
	theme = Global.LevelTheme.BASIC
	size = Vector2i(5, 5)
	goal_count = 4
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 0, 0),
		LevelPiece.new(Piece.Entity.DUCKLING, 0, 4),
		LevelPiece.new(Piece.Entity.DUCKLING, 4, 0),
		LevelPiece.new(Piece.Entity.DUCKLING, 4, 4),
		LevelPiece.new(Piece.Entity.DUCKLING, 1, 1),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 1, 2),
		LevelPiece.new(Piece.Obstacle.LOG_1, 1, 3),
		LevelPiece.new(Piece.Obstacle.LOG_1, 2, 3),
		LevelPiece.new(Piece.Obstacle.LOG_1, 3, 3),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 3, 2),
		LevelPiece.new(Piece.Obstacle.LOG_1, 3, 1),
		LevelPiece.new(Piece.Obstacle.LOG_1, 2, 1),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 2, 2),
	]
	actions = [
		LevelAction.new(Global.Action.STRAIGHT_2, 2),
		LevelAction.new(Global.Action.STRAIGHT_3, 1),
		LevelAction.new(Global.Action.STRAIGHT_2_TURN_1, 3),
	]
