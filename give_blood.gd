class_name GiveBloodFunc
extends ItemFunction

func use(hand: Hand):
	var altars := hand.get_tree().get_nodes_in_group("blood_altar")
	for altar in altars:
		if hand.global_position.distance_to(altar.global_position) > 5 or altar.filled:
			continue
		var hpman : HPManager = hand.get_tree().get_first_node_in_group("hpman")
		hpman.take_damage(5, true)
		altar.fill_up()
		return
