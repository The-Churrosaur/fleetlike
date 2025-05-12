
class_name RewardItemData
extends Resource

enum TYPE {WEAPON, ABILITY, UPGRADE}

@export var scene : PackedScene
@export var type : TYPE
@export var thumbnail : CompressedTexture2D
@export var title = "Default Item"
@export_multiline var description = "" 
