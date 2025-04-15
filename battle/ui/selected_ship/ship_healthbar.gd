
class_name ShipHealthbar
extends TextureProgressBar

var ship : Ship


func _physics_process(delta: float) -> void:
	if ship: 
		max_value = ship.ship_health.max_health
		value = ship.ship_health.health
