extends Node

@export var viewport_path: NodePath = "res://noise_generation"
@onready  var noise = $SubViewport/Box/Noise.texture.noise

@onready var target_viewport = get_node(viewport_path) if viewport_path else get_tree().root.get_viewport()

func _on_button_save_pressed():
	save_to("res://noise_"+ str( Time.get_unix_time_from_system() ) +".png")	

func save_to(path):
	var texture : Texture2D = $SubViewport/Box/Noise.texture
	texture.get_image().save_png(path)

func _on_button_reset_pressed():
	$SubViewport/Box/HB/Controls/NoiseTypeOption.selected = 1
	noise.set_noise_type(1)
	$SubViewport/Box/HB/Controls/FractalTypeOption.selected = 1
	noise.set_fractal_type(1)
	$SubViewport/Box/HB/Controls/HSliderSeed.value = 1
	noise.set_seed(1)
	$SubViewport/Box/HB/Controls/HSliderFrequency.value = 0.01
	noise.set_frequency(0.01)
	$SubViewport/Box/HB/Controls/HSliderOctaves.value = 5
	noise.set_fractal_octaves(5)
	$SubViewport/Box/HB/Controls/HSliderLacunarity.value = 2.0
	noise.set_fractal_lacunarity(2.0)
	$SubViewport/Box/HB/Controls2/HSliderGain.value = 0.5
	noise.set_fractal_gain(0.5)
	$SubViewport/Box/HB/Controls2/HSliderWeighted.value = 0.0
	noise.set_fractal_weighted_strength(0.0)
	
	noise.set_domain_warp_enabled(false)
	$SubViewport/Box/HB/Controls3/DomainControls.set_visible(false)
	$SubViewport/Box/HB/Controls3/DomainWarpEnable/CheckButton.set_pressed_no_signal(false)
	noise.set_domain_warp_amplitude(30.0)
	noise.set_domain_warp_fractal_gain(0.5)
	noise.set_domain_warp_fractal_lacunarity(6.0)
	noise.set_domain_warp_fractal_octaves(5)
	noise.set_domain_warp_frequency(0.05)
	$SubViewport/Box/HB/Controls/FractalTypeOption.selected = 1
	noise.set_domain_warp_fractal_type(1)
	$SubViewport/Box/HB/Controls/NoiseTypeOption.selected = 1
	noise.set_domain_warp_type(0)

func _on_button_random_pressed():
	
	if ! $SubViewport/Box/HB/Controls/NoiseType/Lock.is_pressed():
		var val = randi_range(0,5)
		$SubViewport/Box/HB/Controls/NoiseTypeOption.selected = val
		noise.set_noise_type(val)
		
	if ! $SubViewport/Box/HB/Controls/FractalType/Lock.is_pressed():
		var val = randi_range(0,3)
		$SubViewport/Box/HB/Controls/FractalTypeOption.selected = val
		noise.set_fractal_type(val)
	
	if ! $SubViewport/Box/HB/Controls/Seed/Lock.is_pressed():
		var newseed = randi()
		$SubViewport/Box/HB/Controls/HSliderSeed.value = newseed
		noise.set_seed(newseed)


	if ! $SubViewport/Box/HB/Controls/Frequency/Lock.is_pressed():
		$SubViewport/Box/HB/Controls/HSliderFrequency.value = randf_range(0.01,1.0)
		
	if ! $SubViewport/Box/HB/Controls/Octaves/Lock.is_pressed():
		$SubViewport/Box/HB/Controls/HSliderOctaves.value = randi_range(1,10)
	
	if ! $SubViewport/Box/HB/Controls/Lacunarity/Lock.is_pressed():
		$SubViewport/Box/HB/Controls/HSliderLacunarity.value = randf_range(0.1,10.0)
		
	if ! $SubViewport/Box/HB/Controls2/Gain/Lock.is_pressed():
		$SubViewport/Box/HB/Controls2/HSliderGain.value = randf_range(0.01,1.0)
		
	if ! $SubViewport/Box/HB/Controls2/WeightedStr/Lock.is_pressed():
		$SubViewport/Box/HB/Controls2/HSliderWeighted.value = randf_range(0.0,1.0)
	
	if ! $SubViewport/Box/HB/Controls3/DomainControls/DWAmplitude/Lock.is_pressed():
		$SubViewport/Box/HB/Controls3/DomainControls/Amplitude.value = randf_range(0.01,50.0)

	if ! $SubViewport/Box/HB/Controls3/DomainControls/DWGain/Lock.is_pressed():
		$SubViewport/Box/HB/Controls3/DomainControls/Gain.value = randf_range(0.01,1.0)

	if ! $SubViewport/Box/HB/Controls3/DomainControls/DWLacunarity/Lock.is_pressed():
		$SubViewport/Box/HB/Controls3/DomainControls/Lacunarity.value = randf_range(0.01,20.0)

	if ! $SubViewport/Box/HB/Controls3/DomainControls/DWOctaves/Lock.is_pressed():
		$SubViewport/Box/HB/Controls3/DomainControls/Octaves.value = randi_range(1,10)

	if ! $SubViewport/Box/HB/Controls3/DomainControls/DWFrequency/Lock.is_pressed():
		$SubViewport/Box/HB/Controls3/DomainControls/Frequency.value = randf_range(0.01,1.0)		

	if ! $SubViewport/Box/HB/Controls3/DomainControls/DWFractalType/Lock.is_pressed():
		var val = randi_range(0,2)
		$SubViewport/Box/HB/Controls3/DomainControls/FracType.selected = val
		noise.set_fractal_type(val)

	if ! $SubViewport/Box/HB/Controls3/DomainControls/DWWarpType/Lock.is_pressed():
		var val = randi_range(0,2)
		$SubViewport/Box/HB/Controls3/DomainControls/WarpType.selected = val
		noise.set_fractal_type(val)

func _on_h_slider_octaves_value_changed(value):
	noise.set_fractal_octaves(value)

func _on_h_slider_seed_value_changed(value):
	noise.set_seed(value)

func _on_h_slider_period_value_changed(value):
	noise.set_frequency(value)

func _on_h_slider_persistence_value_changed(value):
	noise.set_fractal_gain(value)

func _on_h_slider_lacunarity_value_changed(value):
	noise.set_fractal_lacunarity(value)

func _on_option_button_item_selected(index):
	noise.set_fractal_type(index)

func _on_h_slider_weighted_value_changed(value):
	noise.set_fractal_weighted_strength(value)

func _on_h_slider_gain_value_changed(value):
	noise.set_fractal_gain(value)

func _on_noise_type_option_item_selected(index):
	noise.set_noise_type(index)

func _on_check_button_toggled(button_pressed):
	noise.set_domain_warp_enabled(button_pressed)
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
