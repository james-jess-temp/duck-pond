extends Level

func _init() -> void:
	title = "1-10"
	theme = Global.LevelTheme.BASIC
	size = Vector2i(5, 5)
	goal_count = 3
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 0, 0),
		LevelPiece.new(Piece.Entity.DUCKLING, 4, 1),
		LevelPiece.new(Piece.Entity.DUCKLING, 3, 3),
		LevelPiece.new(Piece.Entity.DUCKLING, 0, 4),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 1, 3),
	]
	actions = [
		LevelAction.new(Global.Action.STRAIGHT_3, 1),
		LevelAction.new(Global.Action.STRAIGHT_1, 1),
		LevelAction.new(Global.Action.STRAIGHT_3_TURN_1, 2),
	]
