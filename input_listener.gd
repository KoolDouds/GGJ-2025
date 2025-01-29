extends Node

@export var input_name : String

signal input_pressed

func _process(delta):
	if (Input.is_action_just_pressed(input_name)):
		input_pressed.emit()
