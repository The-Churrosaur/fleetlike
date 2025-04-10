
class_name FleetManager
extends Node2D

const SHIP = preload("res://battle/ship/ship.tscn")

@export var player_fleet = false
@export var ships : Array[Ship] = []

var battle_manager : BattleManager


func init(fleet_data : FleetData, manager : BattleManager):
	
	battle_manager = manager
	
	player_fleet = fleet_data.player_fleet
	
	for ship_data in fleet_data.ships: 
		
		var ship = SHIP.instantiate()
		add_child(ship)
		ships.append(ship)
		ship.load_ship(ship_data)
	
