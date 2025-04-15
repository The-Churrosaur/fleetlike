
extends Node2D


@export var health : ShipHealth

@onready var cloud: GPUParticles2D = $cloud
@onready var puff: GPUParticles2D = $puff


func _ready() -> void:
	health.health_changed.connect(_on_health_health_changed)


func _on_health_health_changed(change, new_health):
	if new_health < health.max_health / 4 and new_health - change > health.max_health / 4:
		cloud.visible = true
		puff.restart()
