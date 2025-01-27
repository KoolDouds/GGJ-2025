extends MeshInstance3D

func _process(delta):
	visible = $"../..".using_phase == 1
