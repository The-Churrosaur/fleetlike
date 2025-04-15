
class_name Sensor
extends Area2D


var ship
var contacts = {}


func _on_area_entered(area: Area2D) -> void:
	if area is SensorHurtbox and _is_contact_enemy(area.ship): contacts[area] = area.ship


func _on_area_exited(area: Area2D) -> void:
	if contacts.has(area): contacts.erase(area)


func _is_contact_enemy(other_ship): 
	return CampaignGlobals.faction_enemies[ship.faction].has(other_ship.faction)
