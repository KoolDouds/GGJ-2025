extends Node3D
class_name Hand

enum SIDE {LEFT, RIGHT, MAX}
@export var hand_side : SIDE

@export var weapon : Weapon

var using_phase := 0

func use(battle):
	print("use "+ name)
	using_phase = 1
	await get_tree().create_timer(weapon.pre_time).timeout
	battle.hit(weapon.dmg, hand_side)
	using_phase = 2
	await get_tree().create_timer(weapon.post_time).timeout
	using_phase = 0
