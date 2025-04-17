
class_name ShipHealth
extends Node


signal health_changed(change, new_health)
signal health_zero()


@export var max_health = 100
@export var health = 100


func change_health(change):
	
	var old_health = health
	
	health += change
	
	if health > max_health: health = max_health
	if health < 0: health = 0
	
	if old_health > 0 and health <= 0: health_zero.emit()
	
	health_changed.emit(change, health)
