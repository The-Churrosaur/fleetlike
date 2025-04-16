
extends ShipAbility


@export var duration = 5.0

@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D


func _activate():
	super()
	
	var ship_mover = ship.ship_mover
	
	ship_mover.thrust_force *= 2
	gpu_particles_2d.emitting = true
	await get_tree().create_timer(duration).timeout
	ship_mover.thrust_force /= 2
	gpu_particles_2d.emitting = false
