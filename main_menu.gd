extends Control

@onready var game := load("res://game.tscn")

var starting_game := false

func start_game():
	if (starting_game):return
	starting_game = true
	Engine.time_scale = 1
	var cam : CameraEffects = get_tree().get_first_node_in_group("camera")
	cam.shake(1,1)
	cam.zooming(0.8,1)
	await  get_tree().create_timer(1).timeout
	LoadingManager.load_scene(game)


func restart():
	Engine.time_scale = 1
	LoadingManager.load_scene(game)
	queue_free()
