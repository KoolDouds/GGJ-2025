extends Node

var input_str := []
var code := ["forward","forward","back","back","left","right","left","right","rotate_left","rotate_right"]

func _process(delta):
	if (Input.is_anything_pressed()):
		for i in InputMap.get_actions():
			if (i in code and Input.is_action_just_pressed(i)):
				add_input(i)

func add_input(input : StringName):
	input_str.append(str(input))
	if (input_str.size()>10):
		input_str.remove_at(0)
	if (input_str == code):
		$"..".put_item($"..".ultimate)
		print("amen")
		
