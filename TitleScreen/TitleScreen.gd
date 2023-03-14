extends Control

@onready var _ducks: Array = [
	find_child("Duck1"),
	find_child("Duck2"),
	find_child("Duck3"),
]

const DUCK_MIN_POSITION: Vector2 = Vector2(   0 - 128, 300)
const DUCK_MAX_POSITION: Vector2 = Vector2(1280 + 256, 700)
const DUCK_DURATION_MIN: float = 8.0
const DUCK_DURATION_MAX: float = 16.0

func _ready() -> void:
	for d in _ducks:
		_animate_ducks(d)

func _animate_ducks(d: Duck):
	var duration: float = Global.rng.randf_range(DUCK_DURATION_MIN, DUCK_DURATION_MAX)
	var tweener = create_tween()
	tweener.set_loops()
	tweener.tween_property(d, "position", Vector2(DUCK_MAX_POSITION.x, 0), duration
	).as_relative(
	).from(
	Vector2(DUCK_MIN_POSITION.x, d.get_position().y)).set_delay(duration / 8)


