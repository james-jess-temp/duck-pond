extends Level

func _init() -> void:
	title = "1-5"
	theme = Global.LevelTheme.BASIC
	size = Vector2i(4, 4)
	goal_count = 2
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 0, 0),
		LevelPiece.new(Piece.Entity.DUCKLING, 2, 1),
		LevelPiece.new(Piece.Entity.DUCKLING, 1, 3),
		LevelPiece.new(Piece.Obstacle.LOG_1, 0, 2),
		LevelPiece.new(Piece.Obstacle.LOG_1, 2, 2),
	]
	actions = [
		LevelAction.new(Global.Action.STRAIGHT_1, 1),
		LevelAction.new(Global.Action.STRAIGHT_2, 1),
		LevelAction.new(Global.Action.STRAIGHT_2_TURN_1, 1),
	]
