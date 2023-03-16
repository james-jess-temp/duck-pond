extends Level

func _init() -> void:
	title = "2-4"
	theme = Global.LevelTheme.ASIA
	size = Vector2i(5, 5)
	goal_count = 3
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 0, 0),
		LevelPiece.new(Piece.Entity.DUCKLING, 1, 1),
		LevelPiece.new(Piece.Entity.DUCKLING, 2, 2),
		LevelPiece.new(Piece.Entity.DUCKLING, 3, 3),
		LevelPiece.new(Piece.Obstacle.KOI_1, 1, 2),
		LevelPiece.new(Piece.Obstacle.KOI_1, 2, 1),
		LevelPiece.new(Piece.Obstacle.KOI_1, 3, 2),
	]
	actions = [
		LevelAction.new(Global.Action.STRAIGHT_1, 1),
		LevelAction.new(Global.Action.STRAIGHT_2, 3),
		LevelAction.new(Global.Action.STRAIGHT_2_TURN_1, 1),
		LevelAction.new(Global.Action.STRAIGHT_3_TURN_1, 2),
	]
