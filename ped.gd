class_name Ped
extends Node3D

@onready var holder := $item_holder
@onready var item: Weapon
@onready var ultimate := load("res://Weapons/ultimate.tres")

@onready var qm := get_tree().get_first_node_in_group("questman")

func put_item(new_item: Weapon):
	#if new_item == null: return
	if qm.check_ped():
		new_item = ultimate
		print("OMGOMGOMGOMGOMGOMOG")
	item = new_item
	if new_item != null: holder.add_child(item.gfx.instantiate())

func take_item() -> Weapon:
	for child in holder.get_children():
		child.queue_free()
	print(item)
	var ret = item
	item = null
	return ret
