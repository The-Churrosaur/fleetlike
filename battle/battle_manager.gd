## manages a battle



class_name BattleManager
extends Level

const FLEET_MANAGER = preload("res://battle/fleet_manager.tscn")

@onready var player_spawn: Marker2D = $Map/PlayerSpawn

var player_fleet : FleetManager
var enemy_fleet : FleetManager


func _ready() -> void:
	pass


func load_fleets(player_fleet_data, enemy_fleet_data):
	player_fleet = load_fleet(player_fleet_data)
	enemy_fleet = load_fleet(enemy_fleet_data)


func load_fleet(fleet_data : FleetData):
	var fleet = FLEET_MANAGER.instantiate()
	add_child(fleet)
	fleet.init(fleet_data, self, player_spawn.global_position)
	return fleet


func player_fleet_defeated():
	BattleUIEventBus.player_fleet_defeated.emit()


func enemy_fleet_defeated():
	BattleUIEventBus.enemy_fleet_defeated.emit()
