class_name Ped
extends Node3D

@onready var holder := $Node3D/item_holder
@export var item: Weapon
@onready var ultimate := load("res://Weapons/ultimate.tres")

@onready var qm := get_tree().get_first_node_in_group("questman")

var ultimate_already_created := false

signal ultimate_created
signal on_emptied

func _ready():
	update_display()

func put_item(new_item: Weapon):
	#if new_item == null: return
	if !ultimate_already_created and qm.check_ped():
		new_item = ultimate
		ultimate_created.emit()
		ultimate_already_created = true
		##print("OMGOMGOMGOMGOMGOMOG")
	item = new_item
	update_display()

func update_display():
	for child in holder.get_children():
		child.queue_free()
	if item != null: holder.add_child(item.gfx.instantiate())

func take_item() -> Weapon:
	##print(item)
	var ret = item
	item = null
	on_emptied.emit()
	update_display()
	return ret
