extends Node2D

@onready var hp_label: Label = $"HP"
@onready var manager := $"../manager"

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
		await get_tree().create_timer(move.prep_time).timeout
		manager.get_hit(move.dmg, move.side)
		await get_tree().create_timer(move.cooldown).timeout
		index += 1
		index = index%loop_size
