class_name Level extends Object

const Piece = {
	Entity = {
		DEFAULT = preload("res://Piece/EntityPiece.tscn"),
		DUCK = preload("res://Piece/entities/Duck.tscn"),
		DUCKLING = preload("res://Piece/entities/Duckling.tscn")
	},
	Obstacle = {
		DEFAULT = preload("res://Piece/ObstaclePiece.tscn"),
		ROCK_1 = preload("res://Piece/obstacles/Rock1.tscn"),
		ROCK_2 = preload("res://Piece/obstacles/Rock2.tscn"),
		BAMBOO_1 = preload("res://Piece/obstacles/Bamboo1.tscn"),
		CACTUS_1 = preload("res://Piece/obstacles/Cactus1.tscn"),
		CACTUS_2 = preload("res://Piece/obstacles/Cactus2.tscn"),
		HIPPO_1 = preload("res://Piece/obstacles/Hippo1.tscn"),
		KOI_1 = preload("res://Piece/obstacles/Koi1.tscn"),
		LILY_1 = preload("res://Piece/obstacles/Lily1.tscn"),
		LOG_1 = preload("res://Piece/obstacles/Log1.tscn"),
		SKULL_1 = preload("res://Piece/obstacles/Skull1.tscn"),
	}
}

var title: String
var theme: int
var size: Vector2i
var goal_count: int
var pieces: Array[LevelPiece]
var actions: Array[LevelAction]

func create(piece_scene: GDScript):
	return piece_scene.instantiate()
