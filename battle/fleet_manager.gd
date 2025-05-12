
class_name FleetManager
extends Node2D


@export var player_fleet = false
@export var ships = {}

var battle_manager : BattleManager


func init(fleet_data : FleetData, manager : BattleManager, spawn_point : Vector2):
	battle_manager = manager
	player_fleet = fleet_data.player_fleet
	for ship_data in fleet_data.ships: 
		spawn_ship(ship_data, spawn_point)


func spawn_ship(ship_data : ShipData, spawn_point : Vector2):
	var ship : Ship = ship_data.ship_scene.instantiate()
	add_child(ship)
	ships[ship] = true
	ship.load_ship(ship_data)
	ship.ship_died.connect(_on_ship_died)
	
	var offset = Vector2(randf_range(-battle_manager.spawn_radius, battle_manager.spawn_radius),
						 randf_range(-battle_manager.spawn_radius, battle_manager.spawn_radius))
	ship.global_position = spawn_point + offset

	BattleUIEventBus.ship_spawned.emit(ship)


func _on_ship_died(ship : Ship):
	ships.erase(ship)
	BattleUIEventBus.ship_died.emit(ship)
	if ships.is_empty(): defeated()


func defeated():
	if player_fleet: battle_manager.player_fleet_defeated()
	else: battle_manager.enemy_fleet_defeated()
