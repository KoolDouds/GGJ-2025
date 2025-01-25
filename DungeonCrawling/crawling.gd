class_name Crawling extends Node3D

var player_coord : Vector2 = Vector2(0,0)
var player_ori : Vector2 = Vector2(0,1)
var room_length := 10

@export var center : Node3D

var rooms : Dictionary = {}
var doors := {}

var checking_inventory := false
var inventory : Inventory

func _ready():
	inventory = get_tree().get_first_node_in_group("inventory")
	var room_list = $Center.get_children()
	rooms = {}
	doors = {}
	
	for i in room_list:
		if (!i is Door):
			continue
		var coord = pos_to_coord(i.position, true)
		doors[coord] = i
		print(coord)
	
	for i in room_list:
		if (!i is Room):
			continue
		var coord = pos_to_coord(i.position)
		rooms[coord] = i
		print(coord)
		
		var vec = Vector2.UP
		for xx in range(4):
			if (rooms.has(coord+vec)):
				var door_coord = (coord+vec/2)
				if (!doors.has(door_coord)):
					var door = load("res://DungeonCrawling/door.tscn").instantiate()
					door.position = coord_to_pos(door_coord)
					door.rotation = Vector3(0,vec.angle(),0)
					doors[door_coord] = door
					$Center.add_child(door)
					print(door_coord)
			vec = rotate_vector_90d(vec)

func pos_to_coord(pos:Vector3, half_rounded := false) -> Vector2:
	if (!half_rounded):
		return -Vector2(round(pos.z/room_length),round(pos.x/room_length))

	return -Vector2(round(pos.z/room_length*2)/2,round(pos.x/room_length*2)/2)


func coord_to_pos(coord:Vector2) -> Vector3:
	return -Vector3(coord.y*room_length,0, coord.x*room_length)

func _process(delta):
	if (Input.is_action_just_pressed("rotate_left")):
		if (inventory.opened):
			inventory.scroll_left()
		else:
			rotate_view(true)
	if (Input.is_action_just_pressed("rotate_right")):
		if (inventory.opened):
			inventory.scroll_right()
		else:
			rotate_view(false)
	if (Input.is_action_just_pressed("forward")):
		forward()
	if (Input.is_action_just_pressed("back")):
		inventory.open()
	
	rotation = -Vector3(0,player_ori.angle(),0)
	center.position = Vector3(player_coord.y,0,player_coord.x)*room_length
	
	# DebugMovesVisual
	#queue_redraw()

func forward():
	if (rooms.has(player_coord+player_ori) and doors[player_coord+player_ori/2].is_open()):
		print(player_coord+player_ori)
		pass
	else :
		print("bonk")
		return
	player_coord += player_ori

func rotate_view(clock_wise := true):
	player_ori = rotate_vector_90d(player_ori, clock_wise)

func rotate_vector_90d(vec,clock_wise := true):
	if (clock_wise):
		return Vector2(vec.y*-1, vec.x)
	elif (!clock_wise):
		return Vector2(vec.y, vec.x*-1)

#func _draw():
	## DebugMovesVisual
	#var center := Vector2(100,100) + player_coord*10
	#draw_circle(center, 10, Color.RED)
	#draw_line(center, center+player_ori*20,Color.WHITE)
