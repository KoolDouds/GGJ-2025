extends Node3D

var text : String
var color : Color = Color.WHITE
var lifetime = 0
@export var label : Label3D

func _ready():
	if (lifetime == 0):
		return
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _process(delta):
	label.modulate = color
	label.text = text
