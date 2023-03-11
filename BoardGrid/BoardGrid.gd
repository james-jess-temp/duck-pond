class_name BoardGrid extends Object

signal piece_added(piece, layer_id)
signal piece_moved(piece, layer_id)
signal piece_removed(piece, layer_id)

var _size: Vector2i
var _layers: Dictionary

func _init(size: Vector2i) -> void:
	_size = size
	_init_layers(size)

func _init_layers(size: Vector2i):
	_layers = {}
	for l in Global.Layer.values():
		var layer = BoardGridLayer.new(l, size)
		layer.piece_added.connect(_on_add_piece_finished)
		layer.piece_moved.connect(_on_move_piece_finished)
		layer.piece_removed.connect(_on_remove_piece_finished)
		_layers[l] = layer

func _get_layer_for_piece(piece: Piece):
	if (piece is EntityPiece):
		return _layers[Global.Layer.ENTITY]
	elif (piece is ObstaclePiece):
		return _layers[Global.Layer.OBSTACLE]
	else:
		push_warning("Cannot get layer due to unknown Piece type")
		return null

func add_piece(piece: Piece, pos: Vector2i):
	var layer = _get_layer_for_piece(piece)
	if (!layer): return
	layer.add_piece(piece, pos)

func move_piece(piece: Piece, pos: Vector2i):
	var layer = _get_layer_for_piece(piece)
	if (!layer): return
	layer.move_piece(piece, pos)

func remove_piece(piece: Piece):
	var layer = _get_layer_for_piece(piece)
	if (!layer): return
	layer.remove_piece(piece)

func _on_add_piece_finished(piece: Piece, layer_id: int):
	piece_added.emit(piece, layer_id)

func _on_move_piece_finished(piece: Piece, layer_id: int):
	piece_moved.emit(piece, layer_id)

func _on_remove_piece_finished(piece: Piece, layer_id: int):
	piece_removed.emit(piece, layer_id)

