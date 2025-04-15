
class_name AllShipUI
extends Node2D

@onready var ship_healthbar: ShipHealthbar = $ShipHealthbar

var ship : Ship

func init(ship):
	self.ship = ship
	ship_healthbar.ship = ship
