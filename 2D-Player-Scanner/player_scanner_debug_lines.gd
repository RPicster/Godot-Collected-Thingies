extends Node2D

export var scanner_size := 8
export(int, 0, 20) var scan_for
export(int, LAYERS_2D_PHYSICS) var collide_with
var outer_scanners_positions : PoolVector2Array
var connected_scanners : PoolVector2Array
var result
var last_lines = []
var player_seen = false

func _ready():
	# position scanners
	outer_scanners_positions = [Vector2(0, -scanner_size), Vector2(scanner_size, 0), Vector2(0, scanner_size), Vector2(-scanner_size, 0), ]

func scan(player_pos:Vector2, pos_mod:PoolVector2Array):
	if player_pos == null:
		return false
	var space_state = get_world_2d().direct_space_state
	
	# check which scanners are visible from the center
	connected_scanners = []
	for osp in outer_scanners_positions:
		result = space_state.intersect_ray(global_position, global_position + osp, [], collide_with)
		if !result:
			connected_scanners.append(global_position + osp)
	connected_scanners.append(global_position)
	
	last_lines = []
	for scan_pos in pos_mod:
		for cs in connected_scanners:
			result = space_state.intersect_ray(cs, scan_pos + player_pos, [], collide_with)
			if result and result.collider.get_collision_layer_bit(scan_for):
				last_lines = []
				last_lines.append([cs, scan_pos + player_pos])
				player_seen = true
				update()
				return true
			elif result:
				last_lines.append([cs, result.position])
			else:
				last_lines.append([cs, scan_pos + player_pos])
	player_seen = false
	update()
	return false

func _draw():
	var col = Color(0, 255, 0, 0.2) if player_seen else Color(255, 0, 0, 0.2)
	for line in last_lines:
		draw_line(line[0] - global_position, line[1] - global_position, col, 1)
