class_name LevelAction extends Node

var action: Action
var uses: int

func _init(action: Action, uses: int) -> void:
	self.action = action
	self.uses = uses
