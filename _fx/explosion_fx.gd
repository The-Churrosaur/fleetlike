extends Node2D

@export var health : ShipHealth

@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var main_sprite: Sprite2D = $"../MainSprite"
@onready var scrap_particles: GPUParticles2D = $ScrapParticles


func _ready() -> void:
	health.health_zero.connect(_on_health_zero_health)


func _on_health_zero_health():
	
	reparent(GameGlobals.current_level)
	
	main_sprite.visible = false
	gpu_particles_2d.restart()
	animated_sprite_2d.visible = true
	animated_sprite_2d.play()
	scrap_particles.restart()
