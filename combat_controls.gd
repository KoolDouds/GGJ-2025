extends Node2D

@export var left_hand : Hand
@export var right_hand : Hand

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	handle_input()
	

func handle_input() -> void:
	pass
