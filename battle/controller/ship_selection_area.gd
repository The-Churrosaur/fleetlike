
## TODO for multi-selection - battle ui spawns this
## when hitting a ship, will spawn the same signal as mouse selection

class_name ShipSelectionArea
extends Area2D


@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var selection_start_point : Vector2
var selecting = false


func _physics_process(delta: float) -> void:
	if selecting: _set_selection(selection_start_point, get_global_mouse_position())


func start_selection(start_point : Vector2):
	selecting = true
	monitorable = true
	selection_start_point = start_point
	BattleUIEventBus.area_select_start.emit()


func end_selection():
	selecting = false
	monitorable = false
	_set_selection(Vector2.ZERO, Vector2.ZERO)
	BattleUIEventBus.area_select_end.emit()


func _set_selection(start_point : Vector2, end_point : Vector2):
	collision_shape_2d.shape.size = abs(end_point - start_point)
	global_position = start_point + (end_point - start_point) / 2
