class_name GameUIGoalIcon extends Control

const Icon = {
	ENABLED = preload("res://_assets/GameUIGoal/enabled/duck-filled.png"),
	DISABLED = preload("res://_assets/GameUIGoal/disabled/duck-empty.png")
}

@onready var _texture: TextureRect = find_child("Texture")

func set_enabled(enabled: bool) -> void:
	if (enabled):
		_texture.set_texture(Icon.DISABLED)
	else:
		_texture.set_texture(Icon.ENABLED)
