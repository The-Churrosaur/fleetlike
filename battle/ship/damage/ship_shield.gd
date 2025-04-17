
class_name ShipShield
extends Node2D


@export var shield_health : ShipHealth
@export var regen = 10.0
@export var break_cooldown = 5.0

var on_break_cooldown = false


func _ready() -> void:
	shield_health.health_zero.connect(_on_shield_health_health_zero)


func _physics_process(delta: float) -> void:
	if !on_break_cooldown: shield_health.change_health(regen * delta)


func _on_shield_health_health_zero():
	on_break_cooldown = true
	await get_tree().create_timer(break_cooldown).timeout
	on_break_cooldown = false
