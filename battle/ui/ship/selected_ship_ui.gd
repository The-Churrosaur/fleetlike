extends Node2D


@onready var waypoint_draw: WaypointDraw = $WaypointDraw

var ship : Ship


func init(ship):
	self.ship = ship
	
	
	
	waypoint_draw.init(ship)
