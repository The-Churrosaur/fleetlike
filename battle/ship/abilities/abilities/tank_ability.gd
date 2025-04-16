extends ShipAbility


@export var activation_time = 5.0


func _activate():
	super()
	
	var damage_processor = ship.ship_damage_processor
	
	damage_processor.mult /= 2
	await get_tree().create_timer(activation_time).timeout
	damage_processor.mult *= 2
