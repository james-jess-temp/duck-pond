extends Action

func _init() -> void:
	_icon = preload("res://_assets/GameUIAction/straight-2-turn-1.png")
	_moves = [
		Vector2i(1,0),
		Vector2i(2,0),
		Vector2i(2,1),
	]
