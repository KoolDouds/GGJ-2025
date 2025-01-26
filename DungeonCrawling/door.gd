class_name Door extends Node3D

@export var open := true
@export var open_gfx : Node3D
@export var closed_gfx : Node3D
@export var bois := true

func is_open():
	return open

func open_door():
	if (!open):
		open = true
		$OpenDoor.play()

func _process(delta):
	open_gfx.visible = open
	closed_gfx.visible = !open
