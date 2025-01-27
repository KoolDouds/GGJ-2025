extends Node2D

func _process(delta):
	$"2".frame = 1 if Input.is_action_pressed("back") else 0
	$"4".frame = 1 if Input.is_action_pressed("left") else 0
	$"5".frame = 1 if Input.is_action_pressed("center") else 0
	$"6".frame = 1 if Input.is_action_pressed("right") else 0
	$"7".frame = 1 if Input.is_action_pressed("rotate_left") else 0
	$"8".frame = 1 if Input.is_action_pressed("forward") else 0
	$"9".frame = 1 if Input.is_action_pressed("rotate_right") else 0
