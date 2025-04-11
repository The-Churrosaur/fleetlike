
## also input parser

class_name BattleUI
extends Control


@export var battle_manager : BattleManager

@onready var ship_selection_manager: ShipSelectionManager = $ShipSelectionManager



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



# -- ship moving


func _set_ship_waypoint():
	for ship : Ship in ship_selection_manager.selected_ships.keys():
		ship.waypoint_manager.set_waypoint(get_global_mouse_position())


func _add_ship_waypoint():
	for ship : Ship in ship_selection_manager.selected_ships.keys():
		ship.waypoint_manager.add_waypoint(get_global_mouse_position())
