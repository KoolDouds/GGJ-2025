extends Node2D

var player_coord : Vector2 = Vector2(0,0)
var player_ori : Vector2 = Vector2(0,1)

func _process(delta):
	if (Input.is_action_just_pressed("rotate_left")):
		rotate_view(true)
	if (Input.is_action_just_pressed("rotate_right")):
		rotate_view(false)
	if (Input.is_action_just_pressed("forward")):
		forward()
	
	# DebugMovesVisual
	#queue_redraw()

func forward():
	player_coord += player_ori

func rotate_view(clock_wise := true):
	if (!clock_wise):
		player_ori = Vector2(player_ori.y*-1, player_ori.x)
	elif (clock_wise):
		player_ori = Vector2(player_ori.y, player_ori.x*-1)

#func _draw():
	## DebugMovesVisual
	#var center := Vector2(100,100) + player_coord*10
	#draw_circle(center, 10, Color.RED)
	#draw_line(center, center+player_ori*20,Color.WHITE)
