
class_name Sensor
extends Area2D


@export var contacts = {}


func _on_area_entered(area: Area2D) -> void:
	if area is SensorHitbox: contacts[area] = area.ship


func _on_area_exited(area: Area2D) -> void:
	if area is SensorHitbox: contacts.erase(area)
