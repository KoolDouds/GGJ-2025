class_name Hands extends Node3D

@export var left_hand : Hand
@export var right_hand : Hand

var game
var manager : Battle
var inventory : Inventory

func _ready():
	game = get_tree().get_first_node_in_group("game")
	inventory = get_tree().get_first_node_in_group("inventory")

func _process(delta):
	if manager != null:
		if (Input.is_action_just_pressed("left")):
			if left_hand.using_phase > 0 or right_hand.using_phase == 1: pass
			else: left_hand.use(manager)
		if (Input.is_action_just_pressed("right")):
			if right_hand.using_phase > 0 or left_hand.using_phase == 1: pass
			else: right_hand.use(manager)
	elif inventory.opened:
		if (Input.is_action_just_pressed("left")):
			inventory.switch_with_hands(left_hand)
		if (Input.is_action_just_pressed("right")):
			inventory.switch_with_hands(right_hand)
	else:
		if (Input.is_action_just_pressed("left")):
			left_hand.use(game)
		if (Input.is_action_just_pressed("right")):
			right_hand.use(game)
