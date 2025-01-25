class_name Heal
extends ItemFunction

func use(hand):
	print("heal!!")
	hand.clear_hand()
