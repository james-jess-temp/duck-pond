class_name Board extends Node2D

@onready var _board_background: Node2D = $BoardBackground
@onready var _board_selector: Node2D = $BoardSelector
@onready var _layer_container: Node2D = $LayerContainer
@onready var _camera: Camera2D = $Camera

var _layers: Dictionary
var _tweener: Tween
var _grid: BoardGrid
var _player: Piece
var _size: Vector2i

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

func load_level(level: Level) -> void:
	_size = level.size

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

	_board_selector.draw_selectors(level.size)
	_board_selector.selector_clicked.connect(_on_selector_clicked)

	_board_background.draw_background(level.size)

	var camera_pos: Vector2 = Vector2(
		(level.size.x * Global.TILE_SIZE.x) / 2,
		(level.size.y * Global.TILE_SIZE.y) / 2
	)
	_camera.set_position(camera_pos)

func mark_traversable_tiles(action: Action):
	var moves: Array[Vector2i] = action.get_moves()
	var start_pos: Vector2i = _player.get_grid_position()

	# Check validity
	for m in moves:
		var pos: Vector2i = start_pos + m
		if (pos.x >= _size.x
			|| pos.x < 0
			|| pos.y >= _size.y
			|| pos.y < 0 ):
			return

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

func _on_piece_removed(piece: Piece, layer_id: int):
	_remove_piece_from_layer(piece, layer_id)
	piece.queue_free()

func _on_selector_clicked(pos: Vector2i, type: int) -> void:
	_grid.move_piece(_player, pos)
