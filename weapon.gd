extends Node2D
class_name Weapon


@export var pre_time := 0.5
@export var post_time := 0.5
@export var block_duration := 1

@export var dmg := 1


func attack():
	await get_tree().create_timer(pre_time).timeout
	
	await get_tree().create_timer(post_time).timeout


func block():
	await get_tree().create_timer(block_duration).timeout
