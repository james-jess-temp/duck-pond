extends Action

func _init() -> void:
	_icon = preload("res://_assets/GameUIAction/straight-2.png")
	_moves = [
		Vector2i(0,0),
		Vector2i(0,1),
		Vector2i(0,2),
	]