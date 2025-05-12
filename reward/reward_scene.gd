
class_name RewardScene
extends Level


const REWARD_ITEM_UI = preload("res://reward/reward_item/reward_item_ui.tscn")

@export var reward_table : LootTableData
@export var card_slots : Array[Control]

@export var rewards_container : HBoxContainer
@export var ship_reward_shell_container : ShipRewardShellContainer

@onready var reward_controller: Node2D = $RewardController

var rewards : Dictionary[RewardItemUI, Control]


func generate_rewards():
	for i in 3:
		var reward_ui : RewardItemUI = REWARD_ITEM_UI.instantiate()
		rewards[reward_ui] = card_slots[i]
		rewards[reward_ui].inner_container.add_child(reward_ui)
		reward_ui.load_item_and_init(reward_table.generate_loot())


func spawn_ships(fleet : FleetData):
	ship_reward_shell_container.load_fleet(fleet)


func try_process_reward(reward : RewardItemUI, ship_shell : ShipRewardShell):
	
	var reward_data = reward.reward_item_data
	var ship_data = ship_shell.ship_data
	
	if reward_data.type == RewardItemData.TYPE.WEAPON: return ship_data.try_add_weapon(reward_data)
	if reward_data.type == RewardItemData.TYPE.ABILITY: return ship_data.try_add_ability(reward_data)
	if reward_data.type == RewardItemData.TYPE.UPGRADE: return ship_data.try_add_upgrade(reward_data)


func exit_reward_scene():
	await get_tree().create_timer(2.0).timeout
	GameGlobals.game_manager.load_battle_scene()
