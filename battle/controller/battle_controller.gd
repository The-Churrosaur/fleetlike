
## also input parser

class_name BattleController
extends Controller


@export var battle_manager : BattleManager

@onready var ship_selection_manager: ShipSelectionManager = $ShipSelectionManager
const GRAVITY_AREA = preload("res://battle/gravity/gravity_area.tscn")


func _unhandled_input(event: InputEvent) -> void:
	
	
	if event.is_action_pressed("ui_click", false, true): 
		if !ship_selection_manager.hovered_ships.is_empty(): 
			ship_selection_manager.select_ships()
		else: 
			ship_selection_manager.start_area_selection()
	
	if event.is_action_released("ui_click", true):
		ship_selection_manager.end_area_selection()
		ship_selection_manager.select_ships()
	
	
	if event.is_action_pressed("ui_shift_alt_click", false, true):
		_add_ship_waypoint()
	
	if event.is_action_pressed("ui_alt_click", false, true):
		_set_ship_waypoint()
	
	
	if event.is_action_pressed("ui_accept"):
		if Engine.time_scale == 1.0: Engine.time_scale = 0.05
		else: Engine.time_scale = 1.0
	
	
	if event.is_action_pressed("ui_ability_1"):
		_activate_ship_ability(0)
	
	if event.is_action_pressed("ui_ability_2"):
		_activate_ship_ability(1)
	
	if event.is_action_pressed("ui_ability_3"):
		_activate_ship_ability(2)


# -- ship moving


func _set_ship_waypoint():
	for ship : Ship in ship_selection_manager.selected_ships.keys():
		ship.waypoint_manager.set_waypoint(get_global_mouse_position())


func _add_ship_waypoint():
	for ship : Ship in ship_selection_manager.selected_ships.keys():
		ship.waypoint_manager.add_waypoint(get_global_mouse_position())


# -- ship abilities


func _activate_ship_ability(index):
	for ship : Ship in ship_selection_manager.selected_ships.keys():
		ship.ship_ability_manager.activate_ability(index)
