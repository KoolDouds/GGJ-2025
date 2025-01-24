extends Node2D

@export var hand : Hand

func _process(delta):
	if (hand.hand_side == Hand.SIDE.LEFT):
		scale = Vector2(-1,1)
	if (hand.hand_side == Hand.SIDE.RIGHT):
		scale = Vector2(1,1)
