extends Node2D


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	handle_input()
	

func handle_input() -> void:
	pass

func get_hit(dmg: int, side: Hand.SIDE):
	print("received " + str(dmg) + " damage")
