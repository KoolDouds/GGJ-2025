extends Node3D
class_name Hand

enum SIDE {LEFT, RIGHT, MAX}
@export var hand_side : SIDE

@export var weapon : Weapon

var using_phase := 0

var rien : Weapon

signal on_change_weapon

func _ready():
	rien = load("res://rien.tres")

func set_weapon(_weapon):
	weapon = _weapon
	on_change_weapon.emit()

func use(manager):
	if (manager is Battle):
		use_battle(manager)
	else:
		use_crawling(manager)


func use_battle(battle):
	print("use "+ name)
	using_phase = 1
	await get_tree().create_timer(weapon.pre_time).timeout
	battle.hit(weapon.dmg, hand_side)
	using_phase = 2
	await get_tree().create_timer(weapon.post_time).timeout
	using_phase = 0
	

func use_crawling(game):
	if (weapon != null):
		weapon.use(game)
	else:
		rien.use(game)
