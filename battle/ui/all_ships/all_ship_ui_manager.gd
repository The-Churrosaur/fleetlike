
class_name AllShipUIManager
extends Node2D

const ALL_SHIP_UI = preload("res://battle/ui/all_ships/all_ship_ui.tscn")


var ui_dict = {}


func _ready() -> void:
	BattleUIEventBus.ship_spawned.connect(_on_new_ship_spawned)
	BattleUIEventBus.ship_died.connect(_on_ship_died)


func _physics_process(delta: float) -> void:
	for ship in ui_dict.keys():
		ui_dict[ship].global_position = BattleUICanvas.global_to_canvas(ship.global_position)


func _on_new_ship_spawned(ship : Ship): 
	var ui = ALL_SHIP_UI.instantiate()
	add_child(ui)
	ui.init(ship)
	ui_dict[ship] = ui


func _on_ship_died(ship : Ship):
	ui_dict[ship].queue_free()
	ui_dict.erase(ship)
