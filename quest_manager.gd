class_name QuestMan
extends Node

var blood_amount := 0

func blood():
	blood_amount += 1
	
func check_ped() -> bool:
	return blood_amount >= 2
