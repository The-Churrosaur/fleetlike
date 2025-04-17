
class_name RewardItemData
extends Resource

enum TYPE {WEAPON, ABILITY, UPGRADE, SHIP}

@export var scene : PackedScene
@export var type : TYPE
@export var thumbnail : CompressedTexture2D
@export var title = "Default Reward"
@export_multiline var description = "" 
