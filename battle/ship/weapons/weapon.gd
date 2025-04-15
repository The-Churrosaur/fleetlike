
class_name Weapon
extends Node2D


@onready var fire_timer: Timer = $fire_timer
@onready var aim_timer: Timer = $aim_timer
@onready var muzzle: Marker2D = $Muzzle

var ship
var target : Ship = null


func fire_at_target(ship : Ship):
	target = ship
	aim_timer.start()
	await aim_timer.timeout
	fire_timer.start()


func cease_fire():
	target = null
	aim_timer.stop()
	fire_timer.stop()


func _on_fire_timer_timeout() -> void:
	_fire()


func _fire():
	pass
