class_name BloodAltar
extends Node3D

var filled := false

func fill_up():
	filled = true
	%QuestMan.blood()
	print("BLOOOOOOD")
