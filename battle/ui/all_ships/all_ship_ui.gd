
class_name AllShipUI
extends Node2D

@onready var ship_healthbar: ShipHealthbar = $VBoxContainer/ShipHealthbar
@onready var shield_healthbar: ShieldHealthbar = $VBoxContainer/ShieldHealthbar

var ship : Ship

func init(ship):
	self.ship = ship
	ship_healthbar.init(ship)
	shield_healthbar.init(ship)
