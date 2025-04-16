
class_name ControlGroupManager
extends Node2D


@export var selection_manager : ShipSelectionManager

var groups = {} # group number, array of ships

func _unhandled_input(event: InputEvent) -> void:
	
	# group creation
	
	if event.is_action_pressed("ui_ctrl_1"):
		groups[1] = selection_manager.selected_ships.keys()
	
	elif event.is_action_pressed("ui_ctrl_2"):
		groups[2] = selection_manager.selected_ships.keys()
	
	elif event.is_action_pressed("ui_ctrl_3"):
		groups[3] = selection_manager.selected_ships.keys()
	
	elif event.is_action_pressed("ui_ctrl_4"):
		groups[4] = selection_manager.selected_ships.keys()
	
	# group selection
	
	elif event.is_action_pressed("ui_1"):
		selection_manager.select_given_ships(groups[1])
	
	elif event.is_action_pressed("ui_2"):
		selection_manager.select_given_ships(groups[2])
	
	elif event.is_action_pressed("ui_3"):
		selection_manager.select_given_ships(groups[3])
	
	elif event.is_action_pressed("ui_4"):
		selection_manager.select_given_ships(groups[4])
