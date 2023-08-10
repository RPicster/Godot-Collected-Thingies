extends Node

@export var viewport_path: NodePath = "res://noise_generation"
@onready  var noise = $SubViewport/Box/Noise.texture.noise

@onready var target_viewport = get_node(viewport_path) if viewport_path else get_tree().root.get_viewport()


func _on_button_reset_pressed():
	noise.fractal_octaves = 5
	noise.seed = 1
	noise.frequency = 0.01
	noise.fractal_gain = 0.5
	noise.fractal_lacunarity = 2.0
	noise.set_fractal_type(1)
	noise.fractal_weighted_strength = 0.0
	noise.set_noise_type(1)
	noise.set_domain_warp_type(0)
	noise.set_domain_warp_fractal_type(1)
	noise.set_domain_warp_amplitude(30.0)
	noise.set_domain_warp_fractal_gain(0.5)
	noise.set_domain_warp_fractal_lacunarity(6.0)
	noise.set_domain_warp_fractal_octaves(5)
	noise.set_domain_warp_frequency(0.05)
	noise.domain_warp_enabled = false
	$SubViewport/Box/HB/Controls3/DomainControls.set_visible(false)
	$SubViewport/Box/HB/Controls/NoiseTypeOption.selected = 1
	$SubViewport/Box/HB/Controls/FractalTypeOption.selected = 1

func _on_button_save_pressed():
	save_to("res://captures/noise_"+ str( Time.get_unix_time_from_system() ) +".png")	

func save_to(path):
	var texture : Texture2D = $SubViewport/Box/Noise.texture
	texture.get_image().save_png(path)

func _on_h_slider_octaves_value_changed(value):
	noise.fractal_octaves = value
	

func _on_h_slider_seed_value_changed(value):
	noise.seed = value


func _on_h_slider_period_value_changed(value):
	noise.frequency = value


func _on_h_slider_persistence_value_changed(value):
	noise.fractal_gain = value


func _on_h_slider_lacunarity_value_changed(value):
	noise.fractal_lacunarity = value


func _on_option_button_item_selected(index):
	noise.set_fractal_type(index)


func _on_h_slider_weighted_value_changed(value):
	noise.fractal_weighted_strength = value


func _on_h_slider_gain_value_changed(value):
	noise.fractal_gain = value


func _on_button_random_pressed():
	noise.fractal_octaves = 5
	noise.seed = 1
	noise.frequency = 0.01
	noise.fractal_gain = 0.5
	noise.fractal_lacunarity = 2.0
	noise.set_fractal_type(1)
	noise.fractal_weighted_strength = 0.0
	noise.set_noise_type(1)
	noise.set_domain_warp_type(0)
	noise.set_domain_warp_fractal_type(1)
	noise.set_domain_warp_amplitude(30.0)
	noise.set_domain_warp_fractal_gain(0.5)
	noise.set_domain_warp_fractal_lacunarity(6.0)
	noise.set_domain_warp_fractal_octaves(5)
	noise.set_domain_warp_frequency(0.05)
	noise.domain_warp_enabled = false
	
	$SubViewport/Box/HB/Controls3/DomainControls.set_visible(false)
	$SubViewport/Box/HB/Controls/NoiseTypeOption.selected = 1
	$SubViewport/Box/HB/Controls/FractalTypeOption.selected = 1
	
	$SubViewport/Box/HB/Controls/HSliderSeed.value = randi_range(1,50)
	$SubViewport/Box/HB/Controls2/HSliderGain.value = randf_range(0.01,1.0)
	if ! $SubViewport/Box/HB/Controls/Lacunarity/Lock.button_pressed:
		$SubViewport/Box/HB/Controls/HSliderLacunarity.value = randf_range(1.0,10.0)
	$SubViewport/Box/HB/Controls/HSliderOctaves.value = randi_range(1,10)
	$SubViewport/Box/HB/Controls/HSliderWeighted.value = randf_range(0.0,1.0)



func _on_noise_type_option_item_selected(index):
	noise.set_noise_type(index)


func _on_check_button_toggled(button_pressed):
	noise.domain_warp_enabled = button_pressed
	$SubViewport/Box/HB/Controls3/DomainControls.set_visible(button_pressed)


func _on_warp_type_item_selected(index):
	noise.set_domain_warp_type(index)


func _on_frac_type_item_selected(index):
	noise.set_domain_warp_fractal_type(index)


func _on_amplitude_value_changed(value):
	noise.set_domain_warp_amplitude(value)


func _on_gain_value_changed(value):
	noise.set_domain_warp_fractal_gain(value)


func _on_lacunarity_value_changed(value):
	noise.set_domain_warp_fractal_lacunarity(value)


func _on_octaves_value_changed(value):
	noise.set_domain_warp_fractal_octaves(value)


func _on_frequency_value_changed(value):
	noise.set_domain_warp_frequency(value)

