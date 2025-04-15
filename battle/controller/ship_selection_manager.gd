
class_name ShipSelectionManager
extends Node2D


@onready var selection_area: ShipSelectionArea = $SelectionArea

var hovered_ships = {} # ship -> hover sprite
var selected_ships = {} # ship -> selection sprite



func _ready() -> void:
	BattleUIEventBus.ship_hovered.connect(_on_ship_hovered)
	BattleUIEventBus.ship_unhovered.connect(_on_ship_unhovered)
	BattleUIEventBus.ship_died.connect(_on_ship_died)


func _on_ship_hovered(ship):
	if !hovered_ships.has(ship): hovered_ships[ship] = true


func _on_ship_unhovered(ship):
	if hovered_ships.has(ship): hovered_ships.erase(ship)


func _on_ship_died(ship):
	if hovered_ships.has(ship): _on_ship_unhovered(ship)
	if selected_ships.has(ship): _deselect_ship(ship)


func select_ships():
	for ship : Ship in selected_ships.keys(): _deselect_ship(ship)
	for ship in hovered_ships.keys(): _select_ship(ship)


func start_area_selection():
	selection_area.start_selection(get_global_mouse_position())


func end_area_selection():
	selection_area.end_selection()


func _select_ship(ship : Ship):
	ship.select_ship()
	selected_ships[ship] = true
	BattleUIEventBus.ship_selected.emit(ship)


func _deselect_ship(ship : Ship):
	ship.deselect_ship()
	selected_ships.erase(ship)
	BattleUIEventBus.ship_deselected.emit(ship)
