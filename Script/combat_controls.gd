extends Node2D

func hit(dmg: int, side: Hand.SIDE):
	var enemy := $"..".find_child("enemy")
	if enemy != null:
		print("gave " + str(dmg) + " damage")
		enemy.hp -= dmg

func get_hit(dmg: int, side: Hand.SIDE):
	for child in get_tree().get_nodes_in_group("hand"):
		if child.hand_side == side and child.using_phase == 1:
			print("BLOCKED!!!!!!!!!!")
	print("received " + str(dmg) + " damage")
