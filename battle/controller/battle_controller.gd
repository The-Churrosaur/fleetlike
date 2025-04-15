
## also input parser

class_name BattleController
extends Controller


@export var battle_manager : BattleManager

@onready var ship_selection_manager: ShipSelectionManager = $ShipSelectionManager
const GRAVITY_AREA = preload("res://battle/gravity/gravity_area.tscn")


func _unhandled_input(event: InputEvent) -> void:
	
	if event.is_action_pressed("ui_click"): 
		if !ship_selection_manager.hovered_ships.is_empty(): 
			ship_selection_manager.select_ships()
		else: 
			ship_selection_manager.start_area_selection()
	
	elif event.is_action_released("ui_click"):
		ship_selection_manager.end_area_selection()
		ship_selection_manager.select_ships()
	
	elif event.is_action_pressed("ui_shift_alt_click"):
		_add_ship_waypoint()
	
	elif event.is_action_pressed("ui_alt_click"):
		_set_ship_waypoint()
	
	elif event.is_action_pressed("ui_accept"):
		if Engine.time_scale == 1.0: Engine.time_scale = 0.05
		else: Engine.time_scale = 1.0
		#var grav = GRAVITY_AREA.instantiate()
		#add_child(grav)
		#grav.global_position = get_global_mouse_position()
		
		


# -- ship moving


func _set_ship_waypoint():
	for ship : Ship in ship_selection_manager.selected_ships.keys():
		ship.waypoint_manager.set_waypoint(get_global_mouse_position())


func _add_ship_waypoint():
	for ship : Ship in ship_selection_manager.selected_ships.keys():
		ship.waypoint_manager.add_waypoint(get_global_mouse_position())
