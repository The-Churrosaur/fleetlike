
## the rendered manifestation of a ship in battle
## synonymous with unit

class_name Ship
extends Node2D


@onready var selection_sprite: Sprite2D = $SelectionSprite
@onready var waypoint_manager: ShipWaypointManager = $WaypointManager

var player_ship = false
var movement_target : Vector2


func _physics_process(delta: float) -> void:
	pass


# -- public


func load_ship(ship_data : ShipData):
	global_position = ship_data.spawn_position
	player_ship = ship_data.player_ship


func select_ship():
	print("I was selected: ", self)
	selection_sprite.visible = true


func deselect_ship():
	selection_sprite.visible = false
