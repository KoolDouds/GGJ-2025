class_name Inventory extends Node3D

@export var item_list : Array[Weapon]
var selected_idx : int = 0
var opened := false

@export var open_gfx : Node3D
@export var closed_gfx : Node3D

@export var display_parent : Node3D
@export var diplay_radius := 1.0

func _ready():
	display_items()

func _process(delta):
	
	if (opened):
		update_display_pos()
		

func switch_with_hands(hand : Hand):
	if (item_list.size()<=0):
		return
	
	hurt_acid()
	
	var item_to_store = hand.weapon
	hand.set_weapon(item_list[selected_idx])
	remove_item_at(selected_idx)
	add_item_at(item_to_store, selected_idx)

func hurt_acid():
	$"../HPManager".take_damage(1)

func open():
	opened = !opened
	if (opened):
		visible = true
		closed_gfx.visible = opened
		open_gfx.visible = !opened
		
		await get_tree().create_timer(0.6).timeout
		
		closed_gfx.visible = !opened
		open_gfx.visible = opened
	else:
		await get_tree().create_timer(0.1).timeout
		visible = false

func display_items():
	var children = display_parent.get_children()
	for i in children:
		i.queue_free()
	
	for i in range(item_list.size()):
		var item = item_list[i]
		var clone = item.gfx.instantiate()
		var rot = -TAU/item_list.size()*i
		clone.position = Vector3.RIGHT.rotated(Vector3.UP,rot)*diplay_radius
		clone.rotation = Vector3.UP* rot
		display_parent.add_child(clone)

func update_display_pos():
	var rot :=(TAU/item_list.size()*selected_idx)
	display_parent.rotation = lerp(display_parent.rotation, Vector3.UP*(rot + PI/2),0.5)
	

func add_item(weapon : Weapon):
	add_item_at(weapon, item_list.size())

func add_item_at(weapon : Weapon, idx: int):
	if (weapon == null):
		return
	item_list.insert(idx,weapon)
	clamp_selected_idx()
	display_items()

func remove_item_at(idx : int):
	if (item_list.size() ==0):
		return
	item_list.remove_at(idx)
	clamp_selected_idx()
	display_items()

func scroll_selected(offset : int):
	selected_idx = selected_idx + offset 
	clamp_selected_idx()

func clamp_selected_idx():
	if (item_list.size() == 0):
		selected_idx = 0
		return
	selected_idx = ((selected_idx + item_list.size()))% item_list.size()


func scroll_left():
	scroll_selected(-1)
	
func scroll_right():
	scroll_selected(1)
