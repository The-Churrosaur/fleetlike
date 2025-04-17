
class_name RewardScene
extends Level


const REWARD_ITEM = preload("res://reward/reward_item/reward_item.tscn")
const REWARD_ITEM_UI = preload("res://reward/reward_item/reward_item_ui.tscn")

@export var test_rewards : Array[RewardItemData]

@onready var rewards_container: HBoxContainer = $RewardUICanvas/CenterContainer/VBoxContainer/RewardsContainer
@onready var reward_controller: Node2D = $RewardController
@onready var ship_reward_shell_container: ShipRewardShellContainer = $RewardUICanvas/CenterContainer/VBoxContainer/ShipRewardShellContainer

var reward_items : Array[RewardItem]


#func _ready() -> void:
	#generate_rewards()


func generate_rewards():
	for i in 3:
		var reward_item = REWARD_ITEM.instantiate()
		add_child(reward_item)
		reward_item.load_item(test_rewards[i])
		reward_items.append(reward_item)
		
		var reward_ui = REWARD_ITEM_UI.instantiate()
		rewards_container.add_child(reward_ui)
		reward_ui.init(reward_item)


func spawn_ships(fleet : FleetData):
	ship_reward_shell_container.load_fleet(fleet)
	pass


func process_reward(reward : RewardItem, ship : Ship = null):
	pass
