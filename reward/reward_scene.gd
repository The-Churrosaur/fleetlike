
class_name RewardScene
extends Level


const REWARD_ITEM_UI = preload("res://reward/reward_item/reward_item_ui.tscn")

@export var test_rewards : Array[RewardItemData]

@onready var rewards_container: HBoxContainer = $RewardUICanvas/CenterContainer/VBoxContainer/RewardsContainer
@onready var reward_controller: Node2D = $RewardController
@onready var ship_reward_shell_container: ShipRewardShellContainer = $RewardUICanvas/CenterContainer/VBoxContainer/ShipRewardShellContainer

var rewards : Array[RewardItemUI]


func generate_rewards():
	for i in 3:
		var reward_ui = REWARD_ITEM_UI.instantiate()
		rewards_container.add_child(reward_ui)
		reward_ui.load_item_and_init(test_rewards[i])
		rewards.append(reward_ui)


func spawn_ships(fleet : FleetData):
	ship_reward_shell_container.load_fleet(fleet)


func process_reward(reward : RewardItemUI, ship_shell : ShipRewardShell):
	
	var reward_data = reward.reward_item_data
	var ship_data = ship_shell.ship_data
	
	if reward_data.type == RewardItemData.TYPE.WEAPON: ship_data.weapons.append(reward_data.scene) 
	if reward_data.type == RewardItemData.TYPE.ABILITY: ship_data.abilities.append(reward_data.scene) 
	if reward_data.type == RewardItemData.TYPE.UPGRADE: ship_data.upgrades.append(reward_data.scene) 
	
	exit_reward_scene()


func exit_reward_scene():
	await get_tree().create_timer(4.0).timeout
	GameGlobals.game_manager.load_battle_scene()
