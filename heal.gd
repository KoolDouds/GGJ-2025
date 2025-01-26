class_name Heal
extends ItemFunction

@export var healing_amount := 1

func use(hand: Hand):
	print("heal!!")
	hand.clear_hand()
	var hpman : HPManager = hand.get_tree().get_root().find_child("HPManager", true, false)
	hpman.gain_hp(healing_amount)
