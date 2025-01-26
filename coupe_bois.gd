class_name CoupeBois
extends ItemFunction

func use(hand: Hand):
	var crawling : Crawling = hand.get_tree().get_first_node_in_group("crawling")
	var door_coord := crawling.player_coord+crawling.player_ori*0.5
	var door : Door = crawling.doors.get(door_coord)
	if (door != null and door.bois):
		door.open = true
