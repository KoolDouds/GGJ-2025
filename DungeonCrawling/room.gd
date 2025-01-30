class_name Room extends Node3D

@export var in_rooms := true

@export var randomized_battle := false
@export var battle_pool : Array[PackedScene]


func check_random_battle(battle_packed):
	if (randomized_battle):
		var rand_value := randi() % battle_pool.size()+1
		if (rand_value < battle_pool.size()):
			var battle :Battle= battle_packed.instantiate()
			battle.enemy_res = battle_pool[rand_value]
			add_child(battle)
