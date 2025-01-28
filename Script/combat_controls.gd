class_name Battle
extends Node3D

@export var enemy_res : PackedScene
var enemy : Node3D
@onready var hands : Node3D = get_tree().get_root().find_child("Hands", true, false)
@onready var hp_manager : HPManager = get_tree().get_root().find_child("HPManager", true, false)

@onready var pop_text = load("res://text_pop.tscn")
var active = false

func _ready() -> void:
	enemy = enemy_res.instantiate()
	add_child(enemy)
	enemy.position.z = 1

func _process(delta: float) -> void:
	if active: return
	if hands.global_position.distance_to(global_position) < 5:
		start_battle()
	look_at(hands.position)
	rotation.y += PI
	rotation.x = 0

func start_battle():
	hands.manager = $"."
	active = true
	await get_tree().create_timer(1).timeout
	enemy.attack()

func hit(dmg: int, side: Hand.SIDE):
	enemy.take_damage(dmg)

func get_hit(dmg: int, side: Hand.SIDE):
	for child in get_tree().get_nodes_in_group("hand"):
		if child.hand_side == side and child.using_phase == 1:
			var text = pop_text.instantiate()
			text.text = "BLOCKED!"
			text.color = Color.SKY_BLUE
			text.lifetime = 1.8
			get_tree().get_first_node_in_group("crawling").add_child(text)
			text.global_position = child.position+Vector3.UP*1+Vector3(randf(),randf(),randf())*0.1
			$block.play()
			$block2.play()
			#print("BLOCKED!!!!!!!!!!")
			
			child.block()
			return
	hp_manager.take_damage(dmg)


func die():
	for child in get_tree().get_nodes_in_group("hand"):
		child.reset()
	hands.manager = null
	queue_free()
