extends Node3D

@export var speed := 1.0
@export var rotation_axis := Vector3.UP

func _process(delta):
	rotation += rotation_axis*delta*speed
