class_name BloodAltar
extends Node3D

var filled := false

@onready var qm := get_tree().get_first_node_in_group("questman")

func fill_up():
	filled = true
	qm.blood()
	##print("BLOOOOOOD")
