
class_name SelectedShipUIManager
extends Node2D


const SELECTED_SHIP_UI = preload("res://battle/ui/ship/selected_ship_ui.tscn")

var ships = {}


func _ready() -> void:
	BattleUIEventBus.ship_selected.connect(_on_ship_selected)
	BattleUIEventBus.ship_deselected.connect(_on_ship_deselected)


func _physics_process(delta: float) -> void:
	
	for ship in ships:
		ships[ship].global_position = BattleUICanvas.global_to_canvas(ship.global_position)


func _on_ship_selected(ship):
	var sprite = SELECTED_SHIP_UI.instantiate()
	add_child(sprite)
	sprite.init(ship)
	ships[ship] = sprite


func _on_ship_deselected(ship):
	ships[ship].queue_free()
	ships.erase(ship)
