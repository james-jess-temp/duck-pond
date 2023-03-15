extends Level

func _init() -> void:
	title = "2-2"
	theme = Global.LevelTheme.ASIA
	size = Vector2i(5, 5)
	goal_count = 3
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 0, 0),
		LevelPiece.new(Piece.Entity.DUCKLING, 3, 1),
		LevelPiece.new(Piece.Entity.DUCKLING, 1, 3),
		LevelPiece.new(Piece.Entity.DUCKLING, 2, 4),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 0, 1),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 2, 3),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 3, 3),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 0, 4),
	]
	actions = [
		LevelAction.new(Global.Action.STRAIGHT_1, 1),
		LevelAction.new(Global.Action.STRAIGHT_2, 1),
		LevelAction.new(Global.Action.STRAIGHT_3, 1),
		LevelAction.new(Global.Action.STRAIGHT_3_TURN_1, 1),
	]
