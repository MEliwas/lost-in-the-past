extends Control




func _on_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, value / 5)


func _on_mute_toggled(toggled_on):
	AudioServer.set_bus_mute(0, toggled_on)


func _on_resolution_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920, 1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600, 900))
		2:
			DisplayServer.window_set_size(Vector2i(1280, 720))
		3:
			DisplayServer.window_set_size(Vector2i(1152, 648))

func _on_fps_limition_item_selected(index):
	match index:
		0:
			Engine.max_fps = 30
		1:
			Engine.max_fps = 60
		2:
			Engine.max_fps = 90
		3:
			Engine.max_fps = 120


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")
