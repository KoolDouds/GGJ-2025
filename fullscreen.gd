extends Node

var fullscreen := false

func _process(delta):
	if (Input.is_action_just_pressed("fullscreen")):
		fullscreen = !fullscreen
		if (fullscreen):
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else :
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
