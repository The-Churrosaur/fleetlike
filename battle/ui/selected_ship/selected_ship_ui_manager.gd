
class_name SelectedShipUIManager
extends Node2D


const SELECTED_SHIP_UI = preload("res://battle/ui/selected_ship/selected_ship_ui.tscn")
const SELECTED_SHIP_UI_STATIC = preload("res://battle/ui/selected_ship/selected_ship_ui_static.tscn")

@export var static_ui_parent : Control

var ships_ui : Dictionary[Ship, SelectedShipUI]
var ships_static_ui : Dictionary[Ship, SelectedShipUIStatic]


func _ready() -> void:
	BattleUIEventBus.ship_selected.connect(_on_ship_selected)
	BattleUIEventBus.ship_deselected.connect(_on_ship_deselected)
	BattleUIEventBus.toggle_ship_info.connect(_on_toggle_ship_info)
	BattleUIEventBus.ship_died.connect(_on_ship_killed)


func _physics_process(delta: float) -> void:
	for ship in ships_ui:
		ships_ui[ship].global_position = BattleUICanvas.global_to_canvas(ship.global_position)


func _on_ship_selected(ship):
	var ui = SELECTED_SHIP_UI.instantiate()
	add_child(ui)
	ui.init(ship)
	ui.global_position = BattleUICanvas.global_to_canvas(ship.global_position)
	ships_ui[ship] = ui
	
	var static_ui = SELECTED_SHIP_UI_STATIC.instantiate()
	static_ui_parent.add_child(static_ui)
	static_ui.load_ship_and_init(ship)
	ships_static_ui[ship] = static_ui
	


func _on_ship_deselected(ship):
	ships_ui[ship].queue_free()
	ships_ui.erase(ship)
	
	ships_static_ui[ship].queue_free()
	ships_static_ui.erase(ship)


func _on_ship_killed(ship):
	if ships_ui.has(ship): _on_ship_deselected(ship)


func _on_toggle_ship_info():
	for ui : SelectedShipUI in ships_ui.values(): ui.toggle_info()
