extends Node3D
class_name Hand

@onready var anim : AnimationPlayer = $AnimationPlayer

enum SIDE {LEFT, RIGHT, MAX}
@export var hand_side : SIDE

@export var weapon : Weapon

var using_phase := 0

var atkID := 0

var rien : Weapon

signal on_change_weapon

func _ready():
	rien = load("res://Weapons/rien.tres")
	set_weapon(weapon)

func set_weapon(_weapon):
	$SetWpn.play()
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
	atkID+=1
	var current_atk_id = atkID
	if (weapon == null):
		weapon = rien
	#print("use "+ name)
	using_phase = 1
	anim.speed_scale = 1/weapon.pre_time
	anim.play("attack_start")
	$AtkStrt.play()
	await get_tree().create_timer(weapon.pre_time).timeout
	if (battle == null or atkID != current_atk_id):
		return
	if using_phase == 0:
		block()
		return
	battle.hit(weapon.dmg, hand_side)
	if using_phase == 0 or battle == null:
		reset()
		return
	weapon.use(self, true)
	$AtkLand.play()
	anim.speed_scale = 1/weapon.post_time
	anim.play("attack_end")
	using_phase = 2
	#print("atk "+name)
	await get_tree().create_timer(weapon.post_time).timeout
	if (battle == null or atkID != current_atk_id):
		return
	if (weapon == rien):
		weapon = null
	using_phase = 0

func reset():
	using_phase = 0
	if (weapon == rien):
		weapon = null
	#print("reset "+name)
	anim.speed_scale=1
	anim.play("RESET")

func block():
	anim.stop()
	using_phase = 0

func use_crawling(game):
	anim.play("use")
	if (weapon != null):
		weapon.use(self)
	else:
		$Rien.play()
		rien.use(self)
