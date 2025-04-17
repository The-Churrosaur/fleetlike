
class_name ShipDamageProcessor
extends Node2D


@export var shield_health : ShipHealth
@export var health : ShipHealth
@export var ship : Ship

var mult = 1.0


func damage(amount):
	amount *= CampaignGlobals.speed_damage_reduction.curve.sample(ship.linear_velocity.length())
	amount *= mult
	
	if shield_health.health > 0: shield_health.change_health(-amount)
	else: health.change_health(-amount)
