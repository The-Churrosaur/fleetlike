extends Line2D


var selecting = false
var selection_start_point : Vector2


func _ready() -> void:
	BattleUIEventBus.area_select_start.connect(_on_area_select_start)
	BattleUIEventBus.area_select_end.connect(_on_area_select_end)


func _physics_process(delta: float) -> void:
	if selecting: _set_line(selection_start_point, get_global_mouse_position())


func _on_area_select_start():
	selecting = true
	selection_start_point = get_global_mouse_position()


func _on_area_select_end():
	selecting = false
	clear_points()


func _set_line(start_point : Vector2, end_point : Vector2):
	var dif = end_point - start_point
	var b = start_point + Vector2(dif.x, 0)
	var d = start_point + Vector2(0, dif.y)
	
	clear_points()
	add_point(to_local(start_point), 0)
	add_point(to_local(b), 1)
	add_point(to_local(end_point), 2)
	add_point(to_local(d), 3)
	add_point(to_local(start_point), 4)
