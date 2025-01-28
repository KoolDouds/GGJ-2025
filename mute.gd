extends Node

var muted := true

func _ready():
	var bus_idx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(bus_idx, muted) # or false

func _process(delta):
	if(Input.is_action_just_pressed("mute")):
		muted = !muted
		var bus_idx = AudioServer.get_bus_index("Master")
		AudioServer.set_bus_mute(bus_idx, muted) # or false
