
## temporary god object

class_name GameManager
extends Node2D

const BATTLE_MANAGER = preload("res://battle/battle_manager.tscn")
const REWARD_SCENE = preload("res://reward/reward_scene.tscn")
const FLEET_EDITOR_SCENE = preload("res://editor/fleet_editor_scene.tscn")

@onready var screenfade: CanvasLayer = $Screenfade

@export var player_fleet : FleetData
@export var enemy_fleet : FleetData


func _ready() -> void:
	GameGlobals.game_manager = self
	
	load_reward_scene()


func load_battle_scene():
	
	await _end_scene_and_fade()
	
	var battle = BATTLE_MANAGER.instantiate()
	add_child(battle)
	battle.init(self)
	battle.load_fleets(player_fleet, enemy_fleet)
	GameGlobals.current_level = battle
	
	screenfade.fade_in()


func load_reward_scene():
	
	await _end_scene_and_fade()
	
	var reward_scene = REWARD_SCENE.instantiate()
	add_child(reward_scene)
	reward_scene.init(self)
	reward_scene.generate_rewards()
	reward_scene.spawn_ships(player_fleet)
	GameGlobals.current_level = reward_scene
	
	screenfade.fade_in()


func load_editor_scene():
	
	await _end_scene_and_fade()
	
	var editor_scene = FLEET_EDITOR_SCENE.instantiate()
	add_child(editor_scene)
	editor_scene.init(self)
	editor_scene.spawn_ships(player_fleet)
	
	screenfade.fade_in()



func _end_scene_and_fade():
	screenfade.fade_out()
	await get_tree().create_timer(1.0).timeout
	if GameGlobals.current_level: GameGlobals.current_level.queue_free()
