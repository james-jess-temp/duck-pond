extends Level

func _init() -> void:
	title = "3-5"
	theme = Global.LevelTheme.DESERT
	size = Vector2i(12, 9)
	goal_count = 5
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 0, 0),

		LevelPiece.new(Piece.Entity.DUCKLING, 10, 0),
		LevelPiece.new(Piece.Entity.DUCKLING, 9, 2),
		LevelPiece.new(Piece.Entity.DUCKLING, 1, 6),
		LevelPiece.new(Piece.Entity.DUCKLING, 7, 6),
		LevelPiece.new(Piece.Entity.DUCKLING, 11, 8),

		LevelPiece.new(Piece.Obstacle.ROCK_2, 0, 1),
		LevelPiece.new(Piece.Obstacle.CACTUS_2, 5, 1),
		LevelPiece.new(Piece.Obstacle.ROCK_2, 11, 0),

		LevelPiece.new(Piece.Obstacle.HIPPO_1, 4, 4),
		LevelPiece.new(Piece.Obstacle.CACTUS_1, 9, 3),

		LevelPiece.new(Piece.Obstacle.ROCK_2, 2, 8),
		LevelPiece.new(Piece.Obstacle.ROCK_2, 3, 8),
		LevelPiece.new(Piece.Obstacle.ROCK_2, 4, 8),
	]
	actions = [
		LevelAction.new(Global.Action.STRAIGHT_1, 4),
		LevelAction.new(Global.Action.STRAIGHT_2, 2),
		LevelAction.new(Global.Action.STRAIGHT_3, 2),
		LevelAction.new(Global.Action.STRAIGHT_2_TURN_1, 3),
		LevelAction.new(Global.Action.STRAIGHT_3_TURN_1, 3),
	]
