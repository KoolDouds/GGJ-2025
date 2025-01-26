class_name OpenDoorFunc
extends ItemFunction

func use(hand: Hand):
	var crawling : Crawling = hand.get_tree().get_first_node_in_group("crawling")
	var door_coord := crawling.player_coord+crawling.player_ori*0.5
	if (crawling.doors.has(door_coord)):
		var door : Door = crawling.doors[door_coord]
		door.open = true
