extends Node2D

@export var shipmover : ShipMover

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D


func _physics_process(delta: float) -> void:
	
	if shipmover.thrust_coefficient and shipmover.thrust_coefficient > 0.4: 
		animated_sprite_2d.visible = true
		gpu_particles_2d.emitting = true
	else: 
		animated_sprite_2d.visible = false
		gpu_particles_2d.emitting = false
