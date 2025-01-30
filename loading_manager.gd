extends Node

@onready var loading_screen := load("res://loading_screen.tscn")

func load_scene(scene_to_load : PackedScene):
	Mute.hard_mute(true)
	var loading :Control= loading_screen.instantiate()
	get_tree().root.add_child(loading)
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_packed(scene_to_load)
	await get_tree().create_timer(0.1).timeout
	loading.queue_free()
	Mute.hard_mute(false)
