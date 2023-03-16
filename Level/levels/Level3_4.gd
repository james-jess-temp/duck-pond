extends Level

func _init() -> void:
	title = "3-4"
	theme = Global.LevelTheme.DESERT
	size = Vector2i(8, 5)
	goal_count = 4
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 0, 0),
		LevelPiece.new(Piece.Entity.DUCKLING, 7, 0),
		LevelPiece.new(Piece.Entity.DUCKLING, 2, 1),
		LevelPiece.new(Piece.Entity.DUCKLING, 5, 2),
		LevelPiece.new(Piece.Entity.DUCKLING, 0, 4),
		LevelPiece.new(Piece.Obstacle.ROCK_2, 4, 0),
		LevelPiece.new(Piece.Obstacle.HIPPO_1, 5, 3),
		LevelPiece.new(Piece.Obstacle.SKULL_1, 7, 4),

	]
	actions = [
		LevelAction.new(Global.Action.STRAIGHT_1, 1),
		LevelAction.new(Global.Action.STRAIGHT_3, 1),
		LevelAction.new(Global.Action.STRAIGHT_2_TURN_1, 5),
	]
