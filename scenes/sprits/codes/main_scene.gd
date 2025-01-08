extends Control



func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")


func _on_quit_pressed():
	$ColorRect.top_level = true
	$AnimationPlayer.play("quit_")
	await $AnimationPlayer.animation_finished
	get_tree().quit()


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://scenes/settings.tscn")
