extends Node2D

@export var theme_calme : AudioStreamPlayer
var base_vol_calme : float
@export var theme_dur : AudioStreamPlayer
var base_vol_dur : float
@export var theme_inv : AudioStreamPlayer
var base_vol_inv : float

var hands : Hands
var inv : Inventory

func _ready():
	inv = get_tree().get_first_node_in_group("inventory")
	hands = get_tree().get_first_node_in_group("hands")
	base_vol_calme = theme_calme.volume_db
	base_vol_dur = theme_dur.volume_db
	base_vol_inv = theme_inv.volume_db

func _process(delta):
	theme_calme.volume_db = -1000 if hands.manager !=null or inv.opened else base_vol_calme
	theme_dur.volume_db = -1000 if hands.manager == null or inv.opened else base_vol_dur
	theme_inv.volume_db = -1000 if hands.manager != null or !inv.opened else base_vol_inv
