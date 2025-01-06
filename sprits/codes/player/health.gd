extends ProgressBar


func _process(delta):
	value = Global.health
	Global.health = clamp(Global.health, 0, 100)
