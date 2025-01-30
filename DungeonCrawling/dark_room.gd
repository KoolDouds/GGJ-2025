extends Node

@export var normal_light : Node3D
@export var dark_light : Node3D

func switch_lights():
	normal_light.visible = false
	dark_light.visible = true
