extends Control

@onready var game := load("res://game.tscn")

func start_game():
	print("start")
	Engine.time_scale = 1
	LoadingManager.load_scene(game)


func restart():
	print("restart")
	Engine.time_scale = 1
	LoadingManager.load_scene(game)
	queue_free()
