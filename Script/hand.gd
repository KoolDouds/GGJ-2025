extends Node3D
class_name Hand

@onready var anim : AnimationPlayer = $AnimationPlayer

enum SIDE {LEFT, RIGHT, MAX}
@export var hand_side : SIDE

@export var weapon : Weapon

var using_phase := 0

var rien : Weapon

signal on_change_weapon

func _ready():
	rien = load("res://Weapons/rien.tres")
	set_weapon(weapon)

func set_weapon(_weapon):
	weapon = _weapon
	on_change_weapon.emit()

func clear_hand():
	set_weapon(rien)

func use(manager):
	if (manager is Battle):
		use_battle(manager)
	else:
		use_crawling(manager)

func use_battle(battle):
	if (weapon == null):
		weapon = rien
	print("use "+ name)
	using_phase = 1
	anim.speed_scale = 1/weapon.pre_time
	anim.play("attack_start")
	await get_tree().create_timer(weapon.pre_time).timeout
	if using_phase == 0 or battle == null:
		anim.stop()
		using_phase = 0
		return
	battle.hit(weapon.dmg, hand_side)
	weapon.use(self, true)
	anim.speed_scale = 1/weapon.post_time
	anim.play("attack_end")
	using_phase = 2
	await get_tree().create_timer(weapon.post_time).timeout
	if (weapon == rien):
		weapon = null
	using_phase = 0

func use_crawling(game):
	if (weapon != null):
		weapon.use(self)
	else:
		rien.use(self)
