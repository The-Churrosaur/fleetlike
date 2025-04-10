## manages a battle



class_name BattleManager
extends Level

const FLEET_MANAGER = preload("res://battle/fleet_manager.tscn")

var fleets : Array[FleetManager]



func load_fleet(fleet_data : FleetData):
	
	var fleet = FLEET_MANAGER.instantiate()
	add_child(fleet)
	fleets.append(fleet)
	fleet.init(fleet_data, self)
