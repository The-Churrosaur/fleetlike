
## TODO for multi-selection - battle ui spawns this
## when hitting a ship, will spawn the same signal as mouse selection

class_name ShipSelectionArea
extends Area2D


@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var line_2d: Line2D = $Line2D

var selection_start_point : Vector2
var selecting = false


func _physics_process(delta: float) -> void:
	if selecting:
		_set_selection(selection_start_point, get_global_mouse_position())
		_set_line(selection_start_point, get_global_mouse_position())


func start_selection(start_point : Vector2):
	selecting = true
	monitorable = true
	selection_start_point = start_point


func end_selection():
	selecting = false
	monitorable = false
	_set_selection(Vector2.ZERO, Vector2.ZERO)
	line_2d.clear_points()


func _set_selection(start_point : Vector2, end_point : Vector2):
	collision_shape_2d.shape.size = abs(end_point - start_point)
	global_position = start_point + (end_point - start_point) / 2


func _set_line(start_point : Vector2, end_point : Vector2):
	var dif = end_point - start_point
	var b = start_point + Vector2(dif.x, 0)
	var d = start_point + Vector2(0, dif.y)
	
	line_2d.clear_points()
	line_2d.add_point(line_2d.to_local(start_point), 0)
	line_2d.add_point(line_2d.to_local(b), 1)
	line_2d.add_point(line_2d.to_local(end_point), 2)
	line_2d.add_point(line_2d.to_local(d), 3)
	line_2d.add_point(line_2d.to_local(start_point), 4)
