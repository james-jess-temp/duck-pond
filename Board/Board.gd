class_name Board extends Node2D

signal level_loaded(level: Level)
signal action_finished()

@onready var _board_background: Node2D = $BoardBackground
@onready var _board_selector: Node2D = $BoardSelector
@onready var _layer_container: Node2D = $LayerContainer

var _layers: Dictionary
var _tweener: Tween
var _grid: BoardGrid
var _player: Piece
var _level: Level

func _ready() -> void:
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

func _calc_action_rotations(action: Action) -> Array[Array]:
	var moves: Array[Vector2i] = action.get_moves()

	var action_rotations: Array[Array] = []
	action_rotations.resize(8)
	for i in range(action_rotations.size()):
		var arr = []
		arr.resize(moves.size())
		action_rotations[i] = arr

	for i in range(moves.size()):
		var move: Vector2i = moves[i]
		action_rotations[0][i] = move
		action_rotations[1][i] = Vector2i(move.x, -move.y)
		action_rotations[2][i] = Vector2i(-move.x, move.y)
		action_rotations[3][i] = Vector2i(-move.x, -move.y)
		action_rotations[4][i] = Vector2i(move.y, move.x)
		action_rotations[5][i] = Vector2i(move.y, -move.x)
		action_rotations[6][i] = Vector2i(-move.y, move.x)
		action_rotations[7][i] = Vector2i(-move.y, -move.x)

	return action_rotations

func set_board_position(pos: Vector2) -> void:
	self.set_position(pos)

func load_level(level: Level) -> void:
	_level = level

	for layer in _layer_container.get_children():
		for piece in layer.get_children():
			layer.remove_child(piece)
			piece.queue_free()

	var grid: BoardGrid = BoardGrid.new(level.size)
	grid.piece_added.connect(_on_piece_added)
	grid.piece_moved.connect(_on_piece_moved)
	grid.piece_removed.connect(_on_piece_removed)
	for p in level.pieces:
		var piece = p.piece_scene.instantiate()
		grid.add_piece(piece, p.position)
		if (piece is Duck):
			_player = piece

	_grid = grid

	_board_selector.init_selectors(level.size)
	_board_selector.selector_clicked.connect(_on_selector_clicked)

	_board_background.draw_background(level.size)

	var size = level.size
	var board_position: Vector2 = Vector2(
		-(size.x * Global.TILE_SIZE.x) / 2,
		-(size.y * Global.TILE_SIZE.y) / 2
	)
	set_board_position(board_position)
	level_loaded.emit(level)

func reset() -> void:
	load_level(_level)

func mark_traversable_tiles(action: Action): # Need this here cause need to check board
	_board_selector.reset()

	var start_pos: Vector2i = _player.get_grid_position()
	var action_rotations: Array[Array] = _calc_action_rotations(action)
	var action_rotation_flags: Array[bool] = []
	action_rotation_flags.resize(action_rotations.size())
	action_rotation_flags.fill(true)

	var size = _level.size
	for r in range(action_rotations.size()):
		var moves = action_rotations[r]
		for m in moves:
			if (action_rotation_flags[r] == false): continue
			var pos: Vector2i = start_pos + m
			if (pos.x >= size.x
				|| pos.x < 0
				|| pos.y >= size.y
				|| pos.y < 0
				|| !_grid.is_free_space(pos, Global.Layer.OBSTACLE)
			):
				action_rotation_flags[r] = false

		if (action_rotation_flags[r] == false): continue
		var end_pos: Vector2i = start_pos + (moves[moves.size() - 1])
		_board_selector.set_tile(end_pos, Global.SelectorType.ALLOW)

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
	_tweener = create_tween()
	_tweener.tween_property(piece, "position", pos, 1).set_trans(Tween.TRANS_SINE)
	_tweener.finished.connect(_player._on_move_finished)
	_tweener.finished.connect(_board_selector.reset)
	action_finished.emit()

func _on_piece_removed(piece: Piece, layer_id: int):
	_remove_piece_from_layer(piece, layer_id)
	piece.queue_free()

func _on_selector_clicked(pos: Vector2i, type: int) -> void:
	_grid.move_piece(_player, pos)
