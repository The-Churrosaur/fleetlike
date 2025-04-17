
class_name ShieldHealthbar
extends TextureProgressBar

var ship : Ship

func init(ship):
	self.ship = ship

func _physics_process(delta: float) -> void:
	if ship: 
		max_value = ship.ship_shield.shield_health.max_health
		value = ship.ship_shield.shield_health.health
