extends Weapon

const BULLET = preload("res://battle/ship/weapons/bullets/bullet.tscn")


func _physics_process(delta: float) -> void:
	if target: look_at(target.global_position)


func _fire():
	var bullet = BULLET.instantiate()
	GameGlobals.current_level.add_child(bullet)
	bullet.global_transform = muzzle.global_transform
	bullet.ship = ship
	bullet.target = target
