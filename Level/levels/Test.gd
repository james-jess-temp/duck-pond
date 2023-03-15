extends Level

func _init() -> void:
	title = "Test Level"
	theme = Global.LevelTheme.DESERT
	size = Vector2i(16, 9)
	goal_count = 3
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 2, 2),
		LevelPiece.new(Piece.Entity.DUCKLING, 15, 8),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 1, 7),
		LevelPiece.new(Piece.Obstacle.ROCK_2, 3, 7),
		LevelPiece.new(Piece.Obstacle.BAMBOO_1, 5, 7),
		LevelPiece.new(Piece.Obstacle.CACTUS_1, 7, 7),
		LevelPiece.new(Piece.Obstacle.CACTUS_2, 9, 7),
		LevelPiece.new(Piece.Obstacle.HIPPO_1, 11, 7),
		LevelPiece.new(Piece.Obstacle.KOI_1, 13, 7),
		LevelPiece.new(Piece.Obstacle.LILY_1, 2, 6),
		LevelPiece.new(Piece.Obstacle.LOG_1, 4, 6),
		LevelPiece.new(Piece.Obstacle.SKULL_1, 6, 6),
	]
	actions = [
		LevelAction.new(Global.Action.STRAIGHT_1, 999),
		LevelAction.new(Global.Action.STRAIGHT_2, 999),
		LevelAction.new(Global.Action.STRAIGHT_3, 999),
		LevelAction.new(Global.Action.STRAIGHT_2_TURN_1, 999),
		LevelAction.new(Global.Action.STRAIGHT_3_TURN_1, 999),
		LevelAction.new(Global.Action.TEST, 999),
	]
