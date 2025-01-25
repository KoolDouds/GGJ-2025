extends Node2D

@onready var hp_label: Label = $"HP"
@onready var battle := $".."
@onready var anim : AnimationPlayer = $"AnimationPlayer"

@export var moves : Array[EnemyMove]
var index := 0
var loop_size : int

var max_hp := 20
var hp := max_hp

var dmg := 1
var attack_time := 1

func _ready() -> void:
	loop_size = moves.size()
	attack()

func _process(delta: float) -> void:
	hp_label.text = str(hp)

func attack():
	while true:
		var move := moves[index]
		print("awaiting attack...")
		anim.speed_scale = 1/move.prep_time
		if move.side == Hand.SIDE.LEFT:
			anim.play("attack_left")
		else:
			anim.play("attack_right")
		await get_tree().create_timer(move.prep_time).timeout
		battle.get_hit(move.dmg, move.side)
		await get_tree().create_timer(move.cooldown).timeout
		index += 1
		index = index%loop_size
