extends Resource
class_name Weapon


@export var pre_time := 0.5
@export var post_time := 0.5

@export var dmg := 1

@export var functions : Array[ItemFunction]

@export var gfx : PackedScene

func use(game):
	for i in functions:
		i.use(game)
