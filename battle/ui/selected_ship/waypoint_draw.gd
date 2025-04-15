
class_name WaypointDraw
extends Node2D

const WAYPOINT_UI = preload("res://battle/ui/selected_ship/waypoint_ui.tscn")

@onready var line_2d: Line2D = $Line2D

var ship : Ship


func _physics_process(delta: float) -> void:
	
	if !ship: return
	
	line_2d.clear_points()
	
	var waypoints = ship.waypoint_manager.get_waypoints()
	
	for waypoint in waypoints:
		line_2d.add_point(line_2d.to_local(BattleUICanvas.global_to_canvas(waypoint.global_position)))
		
	line_2d.add_point(line_2d.to_local(BattleUICanvas.global_to_canvas(ship.global_position)))
