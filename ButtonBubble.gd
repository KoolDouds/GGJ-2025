extends ActionButton

func _process(delta):
	enabled = get_tree().get_first_node_in_group("hands").manager == null
	super._process(delta)
