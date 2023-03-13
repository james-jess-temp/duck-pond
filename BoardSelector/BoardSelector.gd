class_name BoardSelector extends Node2D

signal selector_clicked(pos, type)

var _tile_scene = preload("res://BoardSelector/BoardSelectorTile.tscn")
var _list: Array[BoardSelectorTile]
var _list_modified: Array[BoardSelectorTile]
var _grid: Array[Array]
var _size: Vector2i

func _ready() -> void:
	_list = []
	_grid = [[]]

func _init_grid(size: Vector2i) -> void:
	var grid: Array[Array] = []
	grid.resize(size.x)
	for x in range(size.x):
		var y = []
		y.resize(size.y)
		y.fill(null)
		grid[x] = y
	_grid = grid

func init_selectors(size: Vector2i) -> void:
	reset()
	_size = size
	_init_grid(size)
	_list.resize(size.x * size.y)
	for x in range(size.x):
		for y in range(size.y):
			var selector = _tile_scene.instantiate()
			_list[(size.y * x) + y] = selector
			_grid[x][y] = selector
			self.add_child(selector)

			selector.set_grid_position(Vector2i(x, y))
			var pos: Vector2 = Vector2(
				(x + 0.5) * Global.TILE_SIZE.x,
				(y + 0.5) * Global.TILE_SIZE.y)
			selector.set_position(pos)
			selector.set_type(Global.SelectorType.DEFAULT)
			selector.clicked.connect(_on_tile_clicked)

func set_tile(pos: Vector2i, type: int):
	var tile = _grid[pos.x][pos.y]
	tile.set_type(type)
	if (type != Global.SelectorType.DEFAULT):
		_list_modified.push_back(tile)

func reset() -> void:
	for t in _list_modified:
		t.set_type(Global.SelectorType.DEFAULT)
	_list_modified = []

func _on_tile_clicked(pos: Vector2i, type: int) -> void:
	if (type != Global.SelectorType.ALLOW): return
	selector_clicked.emit(pos, type)

