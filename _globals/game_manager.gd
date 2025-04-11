
## temporary god object.
## for now just start a battle



extends Node2D

const BATTLE_MANAGER = preload("res://battle/battle_manager.tscn")

@export var player_fleet : FleetData
@export var enemy_fleet : FleetData



func _ready() -> void:
	
	var battle = BATTLE_MANAGER.instantiate()
	add_child(battle)
	
	battle.load_fleet(player_fleet)
	battle.load_fleet(enemy_fleet)
	
	GameGlobals.current_level = battle
	GameGlobals.current_ui = battle.ui
	GameGlobals.current_camera = battle.camera
