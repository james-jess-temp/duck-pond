extends Level

func _init() -> void:
	title = "3-2"
	theme = Global.LevelTheme.DESERT
	size = Vector2i(5, 5)
	goal_count = 4
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 0, 0),
		LevelPiece.new(Piece.Entity.DUCKLING, 2, 0),
		LevelPiece.new(Piece.Entity.DUCKLING, 4, 2),
		LevelPiece.new(Piece.Entity.DUCKLING, 0, 3),
		LevelPiece.new(Piece.Entity.DUCKLING, 2, 3),
		LevelPiece.new(Piece.Obstacle.CACTUS_1, 1, 0),
		LevelPiece.new(Piece.Obstacle.CACTUS_2, 3, 1),
		LevelPiece.new(Piece.Obstacle.ROCK_2, 1, 4),
		LevelPiece.new(Piece.Obstacle.ROCK_2, 3, 4),
		LevelPiece.new(Piece.Obstacle.ROCK_2, 3, 3),
	]
	actions = [
		LevelAction.new(Global.Action.STRAIGHT_1, 2),
		LevelAction.new(Global.Action.STRAIGHT_2, 1),
		LevelAction.new(Global.Action.STRAIGHT_2_TURN_1, 3),
	]
