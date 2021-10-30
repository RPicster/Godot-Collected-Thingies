extends Node2D

func _ready():
	_global.viewport_container = $ViewportContainer
	_global.viewport = $ViewportContainer/Viewport
