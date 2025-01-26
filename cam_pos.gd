extends Node3D

var inventory : Inventory
@export var pos_crawling : Node3D
@export var pos_inventory : Node3D

func _ready():
	inventory = get_tree().get_first_node_in_group("inventory")

func _process(delta):
	if (inventory.opened):
		position = lerp(position, pos_inventory.position,0.2)
		rotation = lerp(rotation, pos_inventory.rotation,0.2)
	else :
		position = lerp(position, pos_crawling.position,0.2)
		rotation = lerp(rotation, pos_crawling.rotation,0.2)
