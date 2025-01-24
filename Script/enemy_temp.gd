extends Node2D

@onready var hp_label: RichTextLabel = $"HP"
@onready var controls := $"../controls"

var max_hp := 20
var hp := max_hp

var dmg := 1
var attack_time := 1

var attacking := false

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	hp_label.text = str(hp)
	attack()
	print("test")
	

func attack():
	print("awaiting attack...")
	attacking = true
	await get_tree().create_timer(attack_time).timeout
	controls.get_hit(dmg)
