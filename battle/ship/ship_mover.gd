
class_name ShipMover
extends Node2D

@export var ship : Ship
@export var waypoint_manager : ShipWaypointManager

@export var rotation_torque = 5000
@export var thrust_force = 200
@export var thrust_curve : CurveTexture

@export var waypoint_hit_distance = 64

@onready var target: Node2D = $Target


# read by others
var turn_angle
var thrust_coefficient


func _ready() -> void:
	waypoint_manager.new_current_waypoint.connect(_on_waypoint_manager_new_current_waypoint)


func _physics_process(delta: float) -> void:
	
	var waypoint = waypoint_manager.current_waypoint
	
	if waypoint:
		
		target.look_at(waypoint.global_position)
		turn_angle = ship.global_transform.x.angle_to(target.global_transform.x)
		
		ship.apply_torque(rotation_torque * turn_angle)
		
		var distance = ship.global_position.distance_to(waypoint.global_position)
		thrust_coefficient = thrust_curve.curve.sample(distance)
		
		
		
		ship.apply_central_force(ship.transform.x * thrust_force * thrust_coefficient)
		
		if distance < waypoint_hit_distance:
			waypoint_manager.current_waypoint_completed()
	
	else:
		turn_angle = 0
		thrust_coefficient = 0




func _on_waypoint_manager_new_current_waypoint(waypoint):
	pass
