extends Level

func _init() -> void:
	title = "2-2"
	theme = Global.LevelTheme.ASIA
	size = Vector2i(5, 5)
	goal_count = 3
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 0, 0),
		LevelPiece.new(Piece.Entity.DUCKLING, 4, 1),
		LevelPiece.new(Piece.Entity.DUCKLING, 4, 3),
		LevelPiece.new(Piece.Entity.DUCKLING, 1, 4),
		LevelPiece.new(Piece.Obstacle.BAMBOO_1, 4, 2),
		LevelPiece.new(Piece.Obstacle.BAMBOO_1, 0, 3),
		LevelPiece.new(Piece.Obstacle.BAMBOO_1, 4, 4),
	]
	actions = [
		LevelAction.new(Global.Action.STRAIGHT_1, 2),
		LevelAction.new(Global.Action.STRAIGHT_2_TURN_1, 1),
		LevelAction.new(Global.Action.STRAIGHT_3_TURN_1, 3),
	]
