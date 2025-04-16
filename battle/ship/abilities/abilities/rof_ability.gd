extends ShipAbility


@export var fcm : FireControlManager
@export var activation_time = 5.0


func _activate():
	super()
	
	for weapon in fcm.weapons:
		weapon.fire_timer.wait_time /= 2
	
	await get_tree().create_timer(activation_time).timeout
	
	for weapon in fcm.weapons:
		weapon.fire_timer.wait_time *= 2
