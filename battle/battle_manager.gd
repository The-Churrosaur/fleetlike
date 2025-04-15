## manages a battle



class_name BattleManager
extends Level

const FLEET_MANAGER = preload("res://battle/fleet_manager.tscn")

var fleets : Array[FleetManager]


func _ready() -> void:
	pass


func load_fleet(fleet_data : FleetData):
	
	print("bm fleet loading")
	
	var fleet = FLEET_MANAGER.instantiate()
	add_child(fleet)
	
	print(get_children())
	
	fleets.append(fleet)
	fleet.init(fleet_data, self)
