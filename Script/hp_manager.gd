extends Node
class_name HPManager

var max_hp := 20
var hp : int

@onready var hp_label : Label = $"../HPLabel"

func _ready() -> void:
	set_hp(max_hp)

func set_hp(new_hp: int):
	hp = new_hp
	hp_label.text = "HP : " + str(hp)

func take_damage(dmg: int) -> void:
	set_hp(hp-dmg)
	print("received " + str(dmg) + " damage")
	if hp <= 0: die()


func die():
	print("ded :(")
