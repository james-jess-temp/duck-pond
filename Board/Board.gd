class_name Board extends Node2D

@onready var _layer_container: Node2D = $LayerContainer

var _layers: Dictionary
var _tweener: Tween
var _grid: BoardGrid

func _ready() -> void:
	_tweener = create_tween()
	_init_layers()

func _init_layers():
	for l in Global.Layer.values():
		var layer: Node2D = Node2D.new()
		_layer_container.add_child(layer)
		_layers[l] = layer

func _add_piece_to_layer(piece: Piece, layer_id: int):
	var parent: Node2D = _layers[layer_id]
	parent.add_child(piece)

func _remove_piece_from_layer(piece: Piece, layer_id: int):
	var parent: Node2D = _layers[layer_id]
	parent.remove_child(piece)

func load_level(level: Level) -> void:
	var grid: BoardGrid = BoardGrid.new(level.size)
	grid.piece_added.connect(_on_piece_added)
	grid.piece_moved.connect(_on_piece_moved)
	grid.piece_removed.connect(_on_piece_removed)

	for p in level.pieces:
		var piece = p.piece_scene.instantiate()
		grid.add_piece(piece, p.position)



	_grid = grid

func _on_piece_added(piece: Piece, layer_id: int) -> void:
	_add_piece_to_layer(piece, layer_id)
	var grid_pos: Vector2i = piece.get_grid_position()
	var pos: Vector2 = Vector2(
		(grid_pos.x + 0.5) * Global.TILE_SIZE.x,
		(grid_pos.y + 0.5) * Global.TILE_SIZE.y)
	piece.set_position(pos)

func _on_piece_moved(piece: Piece, layer_id: int) -> void:
	var grid_pos: Vector2i = piece.get_grid_position()
	var pos: Vector2 = Vector2(
		(grid_pos.x + 0.5) * Global.TILE_SIZE.x,
		(grid_pos.y + 0.5) * Global.TILE_SIZE.y)
	_tweener.tween_property(piece, "position", pos, 1.0).set_trans(Tween.TRANS_CUBIC)

func _on_piece_removed(piece: Piece, layer_id: int):
	_remove_piece_from_layer(piece, layer_id)
	piece.queue_free()
