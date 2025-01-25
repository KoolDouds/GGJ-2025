extends Node3D

@export var item_list : Array[Weapon]
var selected_idx : int = 0

@export var display_parent : Node3D
@export var diplay_spacing := 1.0

func _ready():
	display_items()

func switch_with_hands(hand : Hand):
	var item_to_store = hand.weapon
	hand.weapon = item_list[selected_idx]
	remove_item_at(selected_idx)
	add_item_at(item_to_store, selected_idx)

func display_items():
	for i in range(item_list.size()):
		var item = item_list[i]
		var clone = item.gfx.instantiate()
		clone.position = Vector3.RIGHT*i*diplay_spacing
		display_parent.add_child(clone)

func update_display_pos():
	display_parent.position = Vector3.LEFT * selected_idx * diplay_spacing

func add_item(weapon : Weapon):
	add_item_at(weapon, item_list.size())

func add_item_at(weapon : Weapon, idx: int):
	item_list.insert(idx,weapon)

func remove_item_at(idx : int):
	item_list.remove_at(idx)

func scroll_selected(offset : int):
	selected_idx = ((selected_idx + item_list.size()) + offset )% item_list.size()

func scroll_left():
	scroll_selected(-1)
	
func scroll_right():
	scroll_selected(1)
