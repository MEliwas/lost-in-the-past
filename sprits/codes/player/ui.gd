extends Control


func _on_return_pressed():
	$"..".position = Vector2.ZERO
	$"../CollisionShape2D".disabled = false
	$CanvasLayer/dead_menu.hide()
	$"..".show()
	Global.health = 100
	Global.stamina = 100

func _on_quit_pressed():
	if $AnimationPlayer.current_animation != "quit":
		$ColorRect.visible = true
		$ColorRect.top_level = true
		$AnimationPlayer.play("quit")
		get_tree().quit()        
