extends Level

func _init() -> void:
	title = "3-1"
	theme = Global.LevelTheme.DESERT
	size = Vector2i(5, 5)
	goal_count = 3
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 0, 0),
		LevelPiece.new(Piece.Entity.DUCKLING, 4, 0),
		LevelPiece.new(Piece.Entity.DUCKLING, 3, 2),
		LevelPiece.new(Piece.Entity.DUCKLING, 2, 3),
		LevelPiece.new(Piece.Obstacle.CACTUS_1, 4, 1),
		LevelPiece.new(Piece.Obstacle.CACTUS_2, 2, 2),
		LevelPiece.new(Piece.Obstacle.ROCK_2, 3, 3),
		LevelPiece.new(Piece.Obstacle.ROCK_2, 4, 3),
	]
	actions = [
		LevelAction.new(Global.Action.STRAIGHT_1, 4),
		LevelAction.new(Global.Action.STRAIGHT_3, 1),
		LevelAction.new(Global.Action.STRAIGHT_2_TURN_1, 2),
		LevelAction.new(Global.Action.STRAIGHT_3_TURN_1, 1),
	]
