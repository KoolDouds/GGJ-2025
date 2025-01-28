extends Control

@onready var game := load("res://game.tscn")

func start_game():
	print("start")
	Engine.time_scale = 1
	get_tree().change_scene_to_packed(game)


func restart():
	print("restart")
	Engine.time_scale = 1
	get_tree().change_scene_to_packed(game)
	queue_free()
