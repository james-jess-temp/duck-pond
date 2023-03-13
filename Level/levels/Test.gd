extends Level

func _init() -> void:
	title = "Test Level"
	theme = Global.LevelTheme.BASIC
	size = Vector2i(8, 6)
	goal_count = 3
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 2, 2),
		LevelPiece.new(Piece.Entity.DUCKLING, 5, 3),
		LevelPiece.new(Piece.Entity.DUCKLING, 4, 3),
		LevelPiece.new(Piece.Entity.DUCKLING, 3, 3),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 1, 1),
		LevelPiece.new(Piece.Obstacle.ROCK_1, 1, 2),
	]
	actions = [
		LevelAction.new(Global.Action.STRAIGHT_1, 3),
		LevelAction.new(Global.Action.STRAIGHT_2, 2),
		LevelAction.new(Global.Action.STRAIGHT_3, 1),
	]
