
class_name ControlGroupManager
extends Node2D


@export var selection_manager : ShipSelectionManager

var groups = {} # group number, array of ships

func _unhandled_input(event: InputEvent) -> void:
	
	# group creation
	
	if event.is_action_pressed("ui_ctrl_1"):
		groups[1] = selection_manager.selected_ships.keys()
	
	if event.is_action_pressed("ui_ctrl_2", false, true):
		groups[2] = selection_manager.selected_ships.keys()
	
	if event.is_action_pressed("ui_ctrl_3", false, true):
		groups[3] = selection_manager.selected_ships.keys()
	
	if event.is_action_pressed("ui_ctrl_4", false, true):
		groups[4] = selection_manager.selected_ships.keys()
	
	# group selection
	
	if event.is_action_pressed("ui_1", false, true):
		if groups.has(1): selection_manager.select_given_ships(groups[1])
	
	if event.is_action_pressed("ui_2", false, true):
		if groups.has(2): selection_manager.select_given_ships(groups[2])
	
	if event.is_action_pressed("ui_3", false, true):
		if groups.has(3): selection_manager.select_given_ships(groups[3])
	
	if event.is_action_pressed("ui_4", false, true):
		if groups.has(4): selection_manager.select_given_ships(groups[4])
