class_name PedFunc
extends ItemFunction

func use(hand: Hand):
	for altar : Ped in hand.get_tree().get_nodes_in_group("ped"):
		if hand.global_position.distance_to(altar.global_position) > 5:
			continue
		var new_item = altar.take_item()
		altar.put_item(hand.weapon)
		hand.set_weapon(new_item)
		break
