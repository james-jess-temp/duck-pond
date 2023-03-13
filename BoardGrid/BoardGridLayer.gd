class_name BoardGridLayer extends Object

signal piece_added(piece, layer_id)
signal piece_moved(piece, layer_id)
signal piece_removed(piece, layer_id)

var _layer_id: int
var _size: Vector2i
var _list: Array[Piece]
var _grid: Array[Array]

func _init(layer_id, size) -> void:
	_layer_id = layer_id
	_size = size
	_init_grid(size)

func _init_grid(size: Vector2i) -> void:
	var grid: Array[Array] = []
	grid.resize(size.x)
	for x in range(size.x):
		var y = []
		y.resize(size.y)
		y.fill(null)
		grid[x] = y
	_grid = grid

func is_grid_position_empty(pos: Vector2i) -> bool:
	return _grid[pos.x][pos.y] == null

func get_layer_id() -> int:
	return _layer_id

func add_piece(piece: Piece, pos: Vector2i) -> void:
	if (!is_grid_position_empty(pos)):
		push_warning("Adding piece in non-empty position")
		return

	_list.push_back(piece)
	_grid[pos.x][pos.y] = piece
	piece.set_grid_position(pos)
	piece_added.emit(piece, _layer_id)

func move_piece(piece: Piece, pos: Vector2i) -> void:
	if (!is_grid_position_empty(pos)):
		push_warning("Moving piece to non-empty position")
		return

	var old_pos: Vector2i = piece.get_grid_position()
	_grid[old_pos.x][old_pos.y] = null
	_grid[pos.x][pos.y] = piece
	piece.set_grid_position(pos)
	piece_moved.emit(piece, _layer_id)

func remove_piece(piece: Piece):
	if (!_list.has(piece)):
		push_warning("Removing piece not in list")
		return

	var pos = piece.get_grid_position()
	_list.erase(piece)
	_grid[pos.x][pos.y] = null
	piece_removed.emit(piece, _layer_id)
