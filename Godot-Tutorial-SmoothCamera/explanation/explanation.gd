extends Node2D

export var cam_move_progress := 0.0 setget set_cam_move_progress

func set_cam_move_progress(value:float):
	if $CameraView:
		$Viewport_LowRes/Example2.position.x = (-value)
		$Viewport_HighRes/Example2.position.x = (-value*20 -20)
		$CameraView.position.x = value*8 + 24
		$CameraView/Camera2d.position.x = -(value - round(value))*8 + 160
		$CameraView/ShaderOffset.text = "Vertex Shader offset: Vector2(0," + str(stepify(value-round(value), 0.1)) + ")"
		$CameraView/Camera2d/CameraView2/CamPosLabel.text = "Camera position: Vector2(0," + str(round(value)) + ")"
		#$Camera2d_pos/CamPosLabelTheo.text = "Calculated Camera position: Vector2(0," + str(stepify(value, 0.1)) + ")"
		$CamPos.global_position = $CameraView/Camera2d.global_position
		$DesCamPos.global_position = Vector2((value)*8 + 184, $CameraView/Camera2d.global_position.y)
		#$Sprite3.position = Vector2(355, 232) + (Vector2(1,0)*(-(value - round(value))*5))
		$Sprite3.material.set_shader_param("cam_offset", Vector2(round(value) - value, 0) )


func _on_HSlider_value_changed(value):
	set_cam_move_progress(value)


func _ready():
	make_pixelgrid()
	set_cam_move_progress(0)

func make_pixelgrid():
	var pxg_size = Vector2($PixelgridLine.points[1])
	var img_size = Vector2(64,22)
	
	for i in img_size.x:
		var new_line = $PixelgridLine.duplicate()
		new_line.clear_points()
		new_line.add_point( Vector2(i*(pxg_size.x/img_size.x), 0 ) )
		new_line.add_point( Vector2(i*(pxg_size.x/img_size.x), pxg_size.y ) )
		$Pixelgrid.add_child(new_line)
	
	for i in img_size.y:
		var new_line = $PixelgridLine.duplicate()
		new_line.clear_points()
		new_line.add_point( Vector2(0, i*(pxg_size.y/img_size.y) ) )
		new_line.add_point( Vector2(pxg_size.x, i*(pxg_size.y/img_size.y) ) )
		$Pixelgrid.add_child(new_line)
