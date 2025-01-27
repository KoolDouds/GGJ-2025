extends ActionButton

func _process(delta):
	var crawling :Crawling = get_tree().get_first_node_in_group("crawling")
	enabled = crawling.is_crawling()
	super._process(delta)
