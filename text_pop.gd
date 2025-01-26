extends Node3D

var text : String
var lifetime = 0
@export var label : Label3D

func _ready():
	if (lifetime == 0):
		return
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _process(delta):
	label.text = text
