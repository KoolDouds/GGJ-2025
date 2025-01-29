extends Node3D

func _process(delta):
	position = (Vector3(randf(),randf(),randf())-Vector3.ONE*0.5)*2*0.05
