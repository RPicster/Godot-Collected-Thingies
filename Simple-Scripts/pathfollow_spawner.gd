extends PathFollow2D

export (PackedScene) var SpawnObject
export var distance := 16.0
export var randomness := 3.0

onready var parent = get_parent()

func _ready():
	var length = parent.curve.get_baked_length()
	
	for i in range(floor(length/distance)):
		offset = i * distance
		var new_spawn_object = SpawnObject.instance()
		call_deferred("add_child", new_spawn_object)
		new_spawn_object.global_position = global_position + Vector2(rand_range(-randomness, randomness), rand_range(-randomness, randomness))
		
