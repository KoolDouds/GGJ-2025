class_name Battle
extends Node2D

@onready var enemy_res := preload("res://enemy_proto.tscn")
var enemy : Node2D
@onready var hands := get_tree().get_root().find_child("Hands", true, false)
@onready var hp_manager : HPManager = $"../HPManager"

func _ready() -> void:
	#hands = get_tree().get_root().find_child("Hands", true, false)
	hands.manager = $"."
	enemy = enemy_res.instantiate()
	enemy.position = Vector2(300, 200)
	add_child(enemy)

func hit(dmg: int, side: Hand.SIDE):
	#var enemy := $"..".find_child("enemy")
	#if enemy != null:
	print("gave " + str(dmg) + " damage")
	enemy.hp -= dmg

func get_hit(dmg: int, side: Hand.SIDE):
	for child in get_tree().get_nodes_in_group("hand"):
		if child.hand_side == side and child.using_phase == 1:
			print("BLOCKED!!!!!!!!!!")
			return
	hp_manager.take_damage(dmg)
	
