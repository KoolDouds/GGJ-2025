extends Node3D

@export var left_hand : Hand
@export var right_hand : Hand

var manager : Battle

func _process(delta):
	if manager == null:
		return
	if (Input.is_action_just_pressed("left")):
		if left_hand.using_phase > 0: pass
		else: left_hand.use(manager)
	if (Input.is_action_just_pressed("right")):
		if right_hand.using_phase > 0: pass
		else: right_hand.use(manager)
