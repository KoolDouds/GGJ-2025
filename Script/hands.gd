extends Node2D

@export var left_hand : Hand
@export var right_hand : Hand

@onready var controls := $"../controls"

func _process(delta):
	if (Input.is_action_just_pressed("left")):
		if left_hand.using_phase > 0: pass
		else: left_hand.use(controls)
	if (Input.is_action_just_pressed("right")):
		if right_hand.using_phase > 0: pass
		else: right_hand.use(controls)
