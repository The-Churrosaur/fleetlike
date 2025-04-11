
class_name ShipMover
extends Node2D

@export var ship : Ship
@export var waypoint_manager : ShipWaypointManager
@export var rcs_fx : RCSFX

@export var max_speed = 40.0
@export var acceleration_time = 1.0
@export var turn_speed = PI/8
@export var min_turn_angle = 0.01
@export var waypoint_hit_distance = 10

@onready var target: Node2D = $Target

var speed = 0

var move_tween


func _ready() -> void:
	waypoint_manager.new_current_waypoint.connect(_on_waypoint_manager_new_current_waypoint)
	
	
	pass
	

func _physics_process(delta: float) -> void:
	
	var waypoint = waypoint_manager.current_waypoint
	
	if waypoint:
		
		target.look_at(waypoint.global_position)
		var turn_angle = ship.global_transform.x.angle_to(target.global_transform.x)
		
		rcs_fx.stop_rotating()
		
		if abs(turn_angle) > min_turn_angle:
			ship.rotate(sign(turn_angle) * turn_speed * delta)
			
			if turn_angle > 0: 
				rcs_fx.rotate_clockwise()
			else: 
				rcs_fx.rotate_counterclock()
		
		
		#var sq_distance = ship.global_position.distance_squared_to(waypoint.global_position)
		#
		#ship.position += ship.transform.x * speed * delta
		#if sq_distance < waypoint_hit_distance ** 2:
			#waypoint_manager.current_waypoint_completed()
		




func _on_waypoint_manager_new_current_waypoint(waypoint):
	target.look_at(waypoint.global_position)
		
	var distance = (waypoint.global_position - ship.global_position).length()
	var turn_angle = ship.global_transform.x.angle_to(target.global_transform.x)
	var turn_time = abs(turn_angle) / turn_speed
	var travel_time = distance / max_speed
	
	if move_tween is Tween: move_tween.kill()
	
	move_tween = create_tween()
	#move_tween.set_trans(Tween.TRANS_ELASTIC)
	#move_tween.tween_property(ship, "global_rotation", ship.global_rotation + turn_angle, 1.0)
	#
	move_tween.set_trans(Tween.TRANS_CUBIC)
	move_tween.tween_property(ship, "global_position", waypoint.global_position, travel_time)
	move_tween.tween_callback(waypoint_manager.current_waypoint_completed)
	
	var accel_tween = create_tween()
	accel_tween.set_trans(Tween.TRANS_CUBIC)
	accel_tween.tween_property(self, "speed", max_speed, acceleration_time)
	
	pass
