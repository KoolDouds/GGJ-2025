class_name Ped
extends Node3D

@onready var holder := $item_holder
@onready var item: Weapon
@onready var ultimate := load("res://Weapons/ultimate.tres")

func put_item(new_item: Weapon):
	if new_item == null: return
	if %QuestMan.check_ped():
		new_item = ultimate
		print("OMGOMGOMGOMGOMGOMOG")
	item = new_item
	holder.add_child(item.gfx.instantiate())

func take_item() -> Weapon:
	for child in holder.get_children():
		child.queue_free()
	var ret = item
	item = null
	return ret
