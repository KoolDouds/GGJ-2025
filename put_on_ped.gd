class_name PedFunc
extends ItemFunction

func use(hand: Hand):
	var altar : Ped = hand.get_tree().get_first_node_in_group("ped")
	if hand.global_position.distance_to(altar.global_position) > 5:
		return
	var new_item = altar.take_item()
	altar.put_item(hand.weapon)
	hand.set_weapon(new_item)
