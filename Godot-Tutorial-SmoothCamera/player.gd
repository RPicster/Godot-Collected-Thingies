extends Sprite

func _physics_process(delta):
	var left_right = -Input.get_action_strength("ui_left") + Input.get_action_strength("ui_right")
	if left_right != 0:
		$AnimationPlayer.play("run")
		scale.x = left_right
	else:
		$AnimationPlayer.play("idle")
	
	position.x += left_right * (15*delta)
