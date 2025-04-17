
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


func process_reward(reward : RewardItemUI, ship_data : ShipData = null) -> bool:
	
	#if reward.reward_item_data.type == RewardItemData.TYPE.SHIP: return false
	
	return true
