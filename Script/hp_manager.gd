extends Node
class_name HPManager

var max_hp := 21
var hp : int

@onready var hp_label : HPGUI = $"../../../Panel/Hpgui"
@onready var gameover := preload("res://GameOver.tscn")
@onready var pop_text = load("res://text_pop.tscn")

func _ready() -> void:
	hp_label.init(max_hp)
	hp = max_hp

func set_hp(new_hp: int):
	hp = min(max_hp, new_hp)
	hp_label.update_display(hp)

func take_damage(dmg: int) -> void:
	set_hp(hp-dmg)
	var text = pop_text.instantiate()
	text.text = str(-dmg)
	text.color = Color.RED
	text.lifetime = 2
	var cam : Camera3D = get_tree().get_first_node_in_group("camera")
	text.global_position = cam.position+Vector3(0,-0.5,-1)+Vector3(randf(),randf(),randf())*0.2
	
	cam.add_child(text)

	print("received " + str(dmg) + " damage")
	if hp <= 0: die()

func gain_hp(heal: int):
	set_hp(hp+heal)

func die():
	print("ded :(")
	get_tree().get_root().add_child(gameover.instantiate())
	Engine.time_scale = 0
