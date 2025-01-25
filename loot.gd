class_name Loot extends Node3D

@export var weapon : Weapon
var looted := false

func interact():
	if (looted):
		return
	var inv : Inventory = get_tree().get_first_node_in_group("inventory")
	inv.add_item(weapon)
	looted = true
