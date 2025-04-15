
class_name FleetManager
extends Node2D


@export var player_fleet = false
@export var ships = {}

var battle_manager : BattleManager


func init(fleet_data : FleetData, manager : BattleManager):
	battle_manager = manager
	player_fleet = fleet_data.player_fleet
	for ship_data in fleet_data.ships: 
		spawn_ship(ship_data)


func spawn_ship(ship_data : ShipData):
	var ship : Ship = ship_data.ship_scene.instantiate()
	add_child(ship)
	ships[ship] = true
	ship.load_ship(ship_data)
	ship.ship_died.connect(_on_ship_died)
	BattleUIEventBus.ship_spawned.emit(ship)


func _on_ship_died(ship : Ship):
	ships.erase(ship)
	BattleUIEventBus.ship_died.emit(ship)
