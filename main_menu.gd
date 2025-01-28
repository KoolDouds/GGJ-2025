extends Control

@onready var game := preload("res://game.tscn")

func start_game():
	Engine.time_scale = 1
	get_tree().current_scene.queue_free()
	var inst := game.instantiate()
	get_tree().get_root().add_child(inst)
	queue_free()

func restart():
	get_tree().reload_current_scene()
	Engine.time_scale = 1
	queue_free()
