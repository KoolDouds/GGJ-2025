extends Node3D

@export var left_hand : Hand
@export var right_hand : Hand

var game
var manager : Battle

func _ready():
	game = get_tree().get_first_node_in_group("game")

func _process(delta):
	if manager != null:
		if (Input.is_action_just_pressed("left")):
			if left_hand.using_phase > 0: pass
			else: left_hand.use(manager)
		if (Input.is_action_just_pressed("right")):
			if right_hand.using_phase > 0: pass
			else: right_hand.use(manager)
	else:
		if (Input.is_action_just_pressed("left")):
			left_hand.use(game)
		if (Input.is_action_just_pressed("right")):
			right_hand.use(game)
