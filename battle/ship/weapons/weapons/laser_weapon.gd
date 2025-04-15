
class_name LaserWeapon
extends Weapon

@export var damage = 5.0

@onready var beam_timer: Timer = $BeamTimer


var damage_target = false


func _physics_process(delta: float) -> void:
	
	
	
	if target and damage_target: 
		
		var to_target = target.global_position - muzzle.global_position
		if to_target.dot(target.global_transform.x) > 0:
			target.ship_damage_processor.damage(damage * CampaignGlobals.rear_damage_mult * delta)
		else:
			target.ship_damage_processor.damage(damage * delta)



func _fire():
	damage_target = true
	beam_timer.start()


func _on_beam_timer_timeout() -> void:
	damage_target = false
