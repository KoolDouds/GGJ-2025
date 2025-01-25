extends Node3D

@export var hand : Hand
var weapon_gfx

func _ready():
	hand.on_change_weapon.connect(change_hand_model)

func change_hand_model():
	if (weapon_gfx != null):
		weapon_gfx.queue_free()
	weapon_gfx = hand.weapon.gfx.instantiate()
	weapon_gfx.position = Vector3.ZERO
	add_child(weapon_gfx)
