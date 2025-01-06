extends ProgressBar


func _process(delta):
	value = Global.stamina
	Global.stamina = clamp(Global.stamina, 0, 100)
