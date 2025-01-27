class_name ActionButton extends Node2D

var enabled := true
@export var input_name := ""

func _ready():
	$"Area2D".input_event.connect(click)

func _process(delta):
	modulate = Color.WHITE if enabled else Color.DIM_GRAY

func click(_vp,_event : InputEvent,_shape):
	if (!_event.is_action_pressed("left_click",true)): return
	if (enabled):
		var event = InputEventAction.new()
		event.action = input_name
		event.pressed = true
		Input.parse_input_event(event)
		for i in range(5):
			await get_tree().process_frame
		event = InputEventAction.new()
		event.action = input_name
		event.pressed = false
		Input.parse_input_event(event)
