extends Level

func _init() -> void:
	title = "1-1"
	theme = Global.LevelTheme.BASIC
	size = Vector2i(9, 3)
	goal_count = 3
	pieces = [
		LevelPiece.new(Piece.Entity.DUCK, 1, 1),
		LevelPiece.new(Piece.Entity.DUCKLING, 5, 1),
		LevelPiece.new(Piece.Entity.DUCKLING, 6, 1),
		LevelPiece.new(Piece.Entity.DUCKLING, 7, 1),
	]
	actions = [
		LevelAction.new(Global.Action.STRAIGHT_3, 2),
	]
