
## temporary god object.
## for now just start a battle


class_name GameManager
extends Node2D

const BATTLE_MANAGER = preload("res://battle/battle_manager.tscn")
const REWARD_SCENE = preload("res://reward/reward_scene.tscn")

@export var player_fleet : FleetData
@export var enemy_fleet : FleetData


func _ready() -> void:
	GameGlobals.game_manager = self
	
	load_reward_scene()

func load_battle_scene():
	if GameGlobals.current_level: GameGlobals.current_level.queue_free()
	var battle = BATTLE_MANAGER.instantiate()
	add_child(battle)
	battle.init(self)
	battle.load_fleets(player_fleet, enemy_fleet)
	GameGlobals.current_level = battle


func load_reward_scene():
	if GameGlobals.current_level: GameGlobals.current_level.queue_free()
	var reward_scene = REWARD_SCENE.instantiate()
	add_child(reward_scene)
	reward_scene.init(self)
	reward_scene.generate_rewards()
	reward_scene.spawn_ships(player_fleet)
	GameGlobals.current_level = reward_scene
