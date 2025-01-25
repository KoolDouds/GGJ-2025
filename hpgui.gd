class_name HPGUI
extends Control

@onready var container := $HFlowContainer
@onready var heart : TextureRect = $HFlowContainer/Heart
@onready var hearts_array : Array[TextureRect] = [heart]

var max_hp : int

func init(max: int):
	max_hp = max
	
func _ready() -> void:
	for i in range(1, max_hp):
		var dup := heart.duplicate()
		hearts_array.append(dup)
		container.add_child(dup)
	update_display(max_hp)

func update_display(hp):
	for i in range(max_hp):
		if i+1 <= hp:
			hearts_array[i].modulate = Color.RED
		else:
			hearts_array[i].modulate = Color.DIM_GRAY
