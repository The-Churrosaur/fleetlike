
class_name ShipData
extends Resource

@export var ship_scene : PackedScene

@export var player_ship = false
@export var faction : CampaignGlobals.FACTIONS = 0
@export var spawn_position := Vector2.ZERO

@export var max_weapons : int = 2
@export var max_abilities : int = 3

@export var weapons : Array[RewardItemData]
@export var abilities : Array[RewardItemData]
@export var upgrades : Array[RewardItemData]


func try_add_weapon(weapon : RewardItemData) -> bool:
	if weapons.size() >= max_weapons: return false
	else: weapons.append(weapon); return true


func try_add_ability(ability : RewardItemData) -> bool:
	if abilities.size() >= max_abilities: return false
	else: abilities.append(ability); return true
