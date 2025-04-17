
class_name ShipData
extends Resource

@export var ship_scene : PackedScene

@export var player_ship = false
@export var faction : CampaignGlobals.FACTIONS = 0
@export var spawn_position := Vector2.ZERO

@export var weapons : Dictionary[int, PackedScene]
@export var abilities : Dictionary[int, PackedScene]
@export var upgrades : Dictionary[int, PackedScene]
