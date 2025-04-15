
class_name ShipAI
extends Node2D

@export var ship : Ship
@export var waypoint_manager : ShipWaypointManager
@export var sensor : Sensor


func _on_decision_timer_timeout() -> void:
	
	if ship.player_ship: return
	
	var contacts = sensor.contacts.values()
	
	if contacts.is_empty(): return
	
	var target = contacts[randi_range(0, contacts.size() - 1)]
	var to_target = target.global_position - global_position
	waypoint_manager.set_waypoint(global_position + to_target/2)
