
class_name ShipWaypointManager
extends Node2D


const SHIP_WAYPOINT = preload("res://battle/ship/waypoints/ship_waypoint.tscn")

signal new_current_waypoint(waypoint)

@export var ship : Ship


var current_waypoint : ShipWaypoint:
	set(new_waypoint):
		current_waypoint = new_waypoint
		if current_waypoint: new_current_waypoint.emit(current_waypoint)


## appends a waypoint
func add_waypoint(waypoint_position : Vector2):
	var new_waypoint = SHIP_WAYPOINT.instantiate()
	add_child(new_waypoint)
	new_waypoint.init(waypoint_position)
	
	print("wm adding new waypoint: ", new_waypoint)
	
	if !current_waypoint: current_waypoint = new_waypoint
	else: current_waypoint.add_waypoint(new_waypoint)
	
	print("new list: ")
	current_waypoint.print_list()


## deletes and sets new waypoint
func set_waypoint(waypoint_position : Vector2):
	
	remove_waypoints()
	
	var new_waypoint = SHIP_WAYPOINT.instantiate()
	add_child(new_waypoint)
	new_waypoint.init(waypoint_position)
	
	current_waypoint = new_waypoint
	
	print("NEW WAYPOINT ADDED: ")
	current_waypoint.print_list()


## call to set current waypoint completed
func current_waypoint_completed():
	#print("waypoint manager: current waypoint completed: ", current_waypoint)
	var next = current_waypoint.next_waypoint
	#if next: next.print_list()
	current_waypoint.waypoint_completed()
	current_waypoint = next


# -- list management


func remove_waypoints():
	if current_waypoint: current_waypoint.remove_waypoints()


func get_last_waypoint():
	return current_waypoint.get_last_waypoint()


## returns in reverse order
func get_waypoints():
	var waypoints = []
	if current_waypoint: current_waypoint.get_waypoints(waypoints)
	return waypoints
