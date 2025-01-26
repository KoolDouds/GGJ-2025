class_name Loot extends Node3D

@export var weapon : Weapon
var looted := false
@export var display: Node3D
@export var coffre_closed: Node3D
@export var coffre_opened: Node3D

var clone

func interact():
	if (looted):
		return
	coffre_closed.visible = false
	coffre_opened.visible = true
	$Loot.play()
	if (weapon == null):
		looted = true
		return
	var crawling : Crawling = get_tree().get_first_node_in_group("crawling")
	crawling.looting = true
	display_item()
	while (true):
		clone.rotation.y += 0.01
		clone.rotation.x -= 0.001
		if (Input.is_action_just_pressed("left")):
			await get_tree().process_frame
			var inv : Inventory = get_tree().get_first_node_in_group("inventory")
			var hands : Hands = get_tree().get_first_node_in_group("hands")
			var hand : Hand = hands.left_hand
			inv.add_item(hand.weapon)
			hand.set_weapon(weapon)
			break
		if (Input.is_action_just_pressed("right")):
			await get_tree().process_frame
			var inv : Inventory = get_tree().get_first_node_in_group("inventory")
			var hands : Hands = get_tree().get_first_node_in_group("hands")
			var hand : Hand = hands.right_hand
			inv.add_item(hand.weapon)
			hand.set_weapon(weapon)
			break
		if (Input.is_action_just_pressed("back")):
			await get_tree().process_frame
			var inv : Inventory = get_tree().get_first_node_in_group("inventory")
			inv.add_item(weapon)
			break
		await get_tree().process_frame
	
	disapear_display()
	
	looted = true
	crawling.looting = false


func display_item():
	clone = weapon.gfx.instantiate()
	display.global_rotation.y = PI
	display.add_child(clone)
	clone.position = Vector3.FORWARD
	clone.rotation.y = PI/2

func disapear_display():

	display.queue_free()
