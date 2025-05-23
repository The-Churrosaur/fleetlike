
class_name ShipRewardShellContainer
extends Container


const SHIP_REWARD_SHELL = preload("res://reward/ship_shell/ship_reward_shell.tscn")

@onready var ship_container: HBoxContainer = $ShipContainer


func load_fleet(fleet_data : FleetData):
	for ship_data in fleet_data.ships:
		var reward_shell = SHIP_REWARD_SHELL.instantiate()
		ship_container.add_child(reward_shell)
		reward_shell.load_ship(ship_data)
