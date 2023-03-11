class_name Level extends Object

const Piece = {
	Entity = {
		DEFAULT = preload("res://Piece/EntityPiece.tscn")
	},
	Obstacle = {
		DEFAULT = preload("res://Piece/ObstaclePiece.tscn")
	}
}

var title: String
var theme: int
var size: Vector2i
var pieces: Array[LevelPiece]

func create(piece_scene: GDScript):
	return piece_scene.instantiate()
