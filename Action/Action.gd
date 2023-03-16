class_name Action extends Object

var _moves: Array[Vector2i] # This is relative to where the player is
var _icon: Texture

func get_moves() -> Array[Vector2i]:
	return _moves

func get_icon() -> Texture:
	return _icon
