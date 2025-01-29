extends ColorRect

func _process(delta):
	color.a -= 0.5*delta
	if (color.a<0):
		queue_free()
