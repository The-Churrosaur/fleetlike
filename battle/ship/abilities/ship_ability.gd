
class_name ShipAbility
extends Node2D


@export var ship : Ship
@export var ability_name = "Default"
@export var cooldown = 10.0

@onready var cooldown_timer: Timer = $CooldownTimer

var on_cooldown = false


func activate():
	if on_cooldown: return
	on_cooldown = true
	cooldown_timer.start(cooldown)
	_activate()


func _on_cooldown_timer_timeout() -> void:
	on_cooldown = false


func _activate():
	pass
