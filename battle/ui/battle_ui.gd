
class_name BattleUI
extends Control


@export var battle_manager : BattleManager

@onready var selection_area: ShipSelectionArea = $SelectionArea

var hovered_ships = {} # ship -> true
var selected_ships = {}


func _ready() -> void:
	
	BattleUIEventBus.ship_hovered.connect(_on_ship_hovered)
	BattleUIEventBus.ship_unhovered.connect(_on_ship_unhovered)


func _unhandled_input(event: InputEvent) -> void:
	
	if event.is_action_pressed("ui_click"): 
		if !hovered_ships.is_empty(): _select_ships()
		else: _start_area_selection()
	
	elif event.is_action_released("ui_click"):
		_end_area_selection()
		_select_ships()
	
	elif event.is_action_pressed("ui_shift_alt_click"):
		print("shiftaltclick")
		_add_ship_waypoint()
	
	elif event.is_action_pressed("ui_alt_click"):
		print("rmb")
		_set_ship_waypoint()


# -- hovering and selection


func _on_ship_hovered(ship):
	if !hovered_ships.has(ship): 
		hovered_ships[ship] = true
		#print("bui hovered ship received, ", hovered_ships)


func _on_ship_unhovered(ship):
	if hovered_ships.has(ship): 
		hovered_ships.erase(ship)
		#print("bui hovered ship left, ", hovered_ships)


func _select_ships():
	
	# call deselect on ships
	for ship : Ship in selected_ships.keys(): ship.deselect_ship()
	
	# hovered into selected
	
	selected_ships.clear()
	for ship in hovered_ships.keys():selected_ships[ship] = true
	
	# call select on ships
	
	for ship : Ship in selected_ships.keys(): ship.select_ship()


func _start_area_selection():
	selection_area.start_selection(get_global_mouse_position())

func _end_area_selection():
	selection_area.end_selection()
	#print("selection ended: ", hovered_ships)


# -- ship moving


func _set_ship_waypoint():
	for ship : Ship in selected_ships:
		ship.waypoint_manager.set_waypoint(get_global_mouse_position())


func _add_ship_waypoint():
	for ship : Ship in selected_ships:
		ship.waypoint_manager.add_waypoint(get_global_mouse_position())
