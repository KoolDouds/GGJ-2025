extends Node
class_name HPManager

var max_hp := 20
var hp : int

@onready var hp_label : HPGUI = $"../../../Panel/Hpgui"

func _ready() -> void:
	hp_label.init(max_hp)
	hp = max_hp

func set_hp(new_hp: int):
	hp = min(max_hp, new_hp)
	hp_label.update_display(hp)

func take_damage(dmg: int) -> void:
	set_hp(hp-dmg)
	print("received " + str(dmg) + " damage")
	if hp <= 0: die()

func gain_hp(heal: int):
	set_hp(hp+heal)

func die():
	print("ded :(")
