extends Node3D

@onready var hp_label: Label3D = $"HP"
@onready var battle := $".."
@onready var anim : AnimationPlayer = $"AnimationPlayer"
@onready var flip := $Flip

@export var moves : Array[EnemyMove]
var index := 0
var loop_size : int

@export var max_hp := 10
var hp := max_hp

var dmg := 1
var attack_time := 1

func _ready() -> void:
	loop_size = moves.size()
	hp_label.text = str(hp)

func die():
	print("enmi is kil >:)")
	battle.die()

func take_damage(dmg):
	hp -= dmg
	print("gave " + str(dmg) + " damage")
	hp_label.text = str(hp)
	if hp <= 0: die()

func attack():
	while true:
		var move := moves[index]
		print("awaiting attack...")
		anim.speed_scale = 1/move.prep_time
		if move.side == Hand.SIDE.LEFT:
			flip.scale.x = -1
		else:
			flip.scale.x = 1
		anim.play("attack")
		await get_tree().create_timer(move.prep_time).timeout
		battle.get_hit(move.dmg, move.side)
		if move.cooldown <= 1:
			anim.speed_scale = 1/move.cooldown
		else:
			anim.speed_scale = 1
		if move.cooldown > 0:
			anim.play("recover")
		await get_tree().create_timer(move.cooldown).timeout
		index += 1
		index = index%loop_size
