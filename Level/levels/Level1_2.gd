extends Level

func _init() -> void:
	title = "1-2"
	theme = Global.LevelTheme.BASIC
	size = Vector2i(6, 5)
	goal_count = 1
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 1, 1),
		LevelPiece.new(Piece.Entity.DUCKLING, 4, 3),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 3, 4),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 3, 3),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 3, 2),
		LevelPiece.new(Piece.Obstacle.LOG_1, 5, 2),
	]
	actions = [
		LevelAction.new(Global.Action.STRAIGHT_3, 2),
	]
