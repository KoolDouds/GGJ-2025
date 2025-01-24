class_name Hand extends Node2D

enum SIDE {LEFT, RIGHT, MAX}
@export var hand_side : SIDE

func use():
	print("use "+ name)
