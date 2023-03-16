extends Level

func _init() -> void:
	title = "2-5"
	theme = Global.LevelTheme.ASIA
	size = Vector2i(5, 5)
	goal_count = 3
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 0, 0),
		LevelPiece.new(Piece.Entity.DUCKLING, 0, 2),
		LevelPiece.new(Piece.Entity.DUCKLING, 2, 4),
		LevelPiece.new(Piece.Entity.DUCKLING, 4, 4),
		LevelPiece.new(Piece.Obstacle.BAMBOO_1, 0, 1),
		LevelPiece.new(Piece.Obstacle.LILY_1, 1, 1),
		LevelPiece.new(Piece.Obstacle.LILY_1, 3, 3),
		LevelPiece.new(Piece.Obstacle.BAMBOO_1, 3, 4),
	]
	actions = [
		LevelAction.new(Global.Action.STRAIGHT_1, 2),
		LevelAction.new(Global.Action.STRAIGHT_2, 1),
		LevelAction.new(Global.Action.STRAIGHT_3, 1),
		LevelAction.new(Global.Action.STRAIGHT_2_TURN_1, 3),
	]
