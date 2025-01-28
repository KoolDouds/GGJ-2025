extends Node

var muted := true
var hard_muted := false

func _ready():
	update_mute()

func hard_mute(value):
	hard_muted = value
	update_mute()

func _process(delta):
	if(Input.is_action_just_pressed("mute")):
		muted = !muted
		update_mute()

func update_mute():
	var bus_idx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(bus_idx, muted or hard_muted) 
