class_name ShipWaypoint
extends Node2D


var waypoint_position : Vector2
var next_waypoint : ShipWaypoint

@onready var line_2d: Line2D = $Line2D


func _physics_process(delta: float) -> void:
	
	if next_waypoint:
		line_2d.add_point(line_2d.to_local(global_position), 0)
		line_2d.add_point(line_2d.to_local(next_waypoint.global_position), 1)


func init(pos):
	waypoint_position = pos
	global_position = waypoint_position


func clean_up():
	queue_free()


# -- list management


func add_waypoint(new_waypoint : ShipWaypoint):
	if !next_waypoint: next_waypoint = new_waypoint; return
	else: next_waypoint.add_waypoint(new_waypoint)


func get_last_waypoint():
	if next_waypoint: return next_waypoint.get_last_waypoint()
	else: return self


func remove_waypoints():
	if next_waypoint: next_waypoint.remove_waypoints()
	clean_up()


func print_list():
	print(self)
	if next_waypoint: next_waypoint.print_list()


# -- 

func waypoint_completed():
	clean_up()
