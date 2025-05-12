
class_name SelectedShipUIStatic
extends MarginContainer


@onready var item_display: ItemDisplayPopup = $VBoxContainer/ItemDisplay


func load_ship_and_init(ship: Ship):
	item_display.load_ship_data_and_init(ship.ship_data)
