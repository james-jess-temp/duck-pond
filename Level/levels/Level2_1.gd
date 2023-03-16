extends Level

func _init() -> void:
	title = "2-1"
	theme = Global.LevelTheme.ASIA
	size = Vector2i(4, 4)
	goal_count = 2
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 0, 0),
		LevelPiece.new(Piece.Entity.DUCKLING, 0, 2),
		LevelPiece.new(Piece.Entity.DUCKLING, 1, 1),
		LevelPiece.new(Piece.Obstacle.BAMBOO_1, 1, 3),
		LevelPiece.new(Piece.Obstacle.BAMBOO_1, 2, 3),
	]
	actions = [
		LevelAction.new(Global.Action.STRAIGHT_2_TURN_1, 2),
	]
