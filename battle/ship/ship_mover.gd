
class_name ShipMover
extends Node2D

@export var ship : Ship
@export var waypoint_manager : ShipWaypointManager

@export var speed = 10.0

@onready var target: Node2D = $Target

var movement_tween


func _ready() -> void:
	waypoint_manager.new_current_waypoint.connect(_on_waypoint_manager_new_current_waypoint)
	
	
	pass
	

func _physics_process(delta: float) -> void:
	pass


func _on_waypoint_manager_new_current_waypoint(waypoint):
	target.global_position = waypoint.global_position
	movement_tween = create_tween()
	movement_tween.tween_property(ship,"global_position", target.global_position, 5)
	movement_tween.tween_callback(waypoint_manager.current_waypoint_completed)
