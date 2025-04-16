
class_name AbilitiesContainer
extends Node

const ABILITY_UI = preload("res://battle/ui/selected_ship/ability/ability_ui.tscn")
@onready var h_box_container: HBoxContainer = $HBoxContainer

var ship : Ship


func init(ship):
	self.ship = ship
	
	for i in ship.ship_ability_manager.abilities.size():
		var ability = ship.ship_ability_manager.abilities[i]
		var ability_ui = ABILITY_UI.instantiate()
		ability_ui.init(ability, i)
		h_box_container.add_child(ability_ui)
