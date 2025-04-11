class_name ShipWaypoint
extends Node2D


var waypoint_position : Vector2
var next_waypoint : ShipWaypoint


func init(pos):
	waypoint_position = pos
	global_position = waypoint_position


func clean_up():
	queue_free()


# -- list management


func add_waypoint(new_waypoint : ShipWaypoint):
	if !next_waypoint: next_waypoint = new_waypoint; return
	else: next_waypoint.add_waypoint(new_waypoint)


func get_waypoints(array : Array):
	if next_waypoint: next_waypoint.get_waypoints(array)
	array.append(self)


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
