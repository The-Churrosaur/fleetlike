
## the rendered manifestation of a ship in battle

class_name Ship
extends Node2D


@onready var waypoint_manager: ShipWaypointManager = $WaypointManager
@onready var rotation_dolly: Node2D = $RotationDolly

var player_ship = false


# -- public


func load_ship(ship_data : ShipData):
	global_position = ship_data.spawn_position
	player_ship = ship_data.player_ship


func select_ship():
	print("I was selected: ", self)


func deselect_ship():
	pass
