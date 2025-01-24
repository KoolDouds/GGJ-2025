extends Node2D

@export var left_hand : Hand
@export var right_hand : Hand

func _process(delta):
	if (Input.is_action_just_pressed("left")):
		left_hand.use()
	if (Input.is_action_just_pressed("right")):
		right_hand.use()
