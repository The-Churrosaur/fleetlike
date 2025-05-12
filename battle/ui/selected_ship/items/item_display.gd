
class_name ItemDisplayPopup
extends MarginContainer


const ITEM_UI = preload("res://battle/ui/selected_ship/items/item_ui.tscn")

@onready var weapons_ui_container: HBoxContainer = $MarginContainer/VBoxContainer/WeaponsUIContainer
@onready var abilities_ui_container: HBoxContainer = $MarginContainer/VBoxContainer/AbilitiesUIContainer
@onready var upgrades_ui_container: HBoxContainer = $MarginContainer/VBoxContainer/UpgradesUIContainer

var ship_data : ShipData


func load_ship_data_and_init(data : ShipData):
	
	ship_data = data
	
	for weapon_data in data.weapons: 
		var ui = ITEM_UI.instantiate()
		weapons_ui_container.add_child(ui)
		ui.load_item_and_init(weapon_data)
	
	for ability_data in data.abilities: 
		var ui = ITEM_UI.instantiate()
		abilities_ui_container.add_child(ui)
		ui.load_item_and_init(ability_data)
	
	for upgrades_data in data.upgrades: 
		var ui = ITEM_UI.instantiate()
		upgrades_ui_container.add_child(ui)
		ui.load_item_and_init(upgrades_data)


func clear_items():
	for child in weapons_ui_container.get_children(): child.queue_free()
	for child in abilities_ui_container.get_children(): child.queue_free()
	for child in upgrades_ui_container.get_children(): child.queue_free()
