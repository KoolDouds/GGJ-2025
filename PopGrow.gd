extends Node3D

@export var curve : Curve
@export var total_time := 1.0
@export var max_size := 1.0

var t := 0.0

func _process(delta):
	scale = Vector3.ONE * curve.sample(t/total_time)
	t+=delta
