extends Node2D


@onready var waypoint_draw: WaypointDraw = $WaypointDraw
@onready var sensor_radius_draw: Node2D = $SensorRadiusDraw
@onready var abilities_container: AbilitiesContainer = $Control/AbilitiesContainer

var ship : Ship


func init(ship):
	self.ship = ship
	
	waypoint_draw.ship = ship
	sensor_radius_draw.init(ship)
	abilities_container.init(ship)
