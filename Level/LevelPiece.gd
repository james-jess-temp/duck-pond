class_name LevelPiece extends Object

var piece_scene: PackedScene
var position: Vector2i

func _init(piece_scene: PackedScene, x: int, y: int) -> void:
	self.piece_scene = piece_scene
	self.position = Vector2i(x, y)
