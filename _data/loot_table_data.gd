
class_name LootTableData
extends Resource

@export var table : Array[RewardItemData]

func generate_loot():
	return table[randi_range(0, table.size() - 1)]
