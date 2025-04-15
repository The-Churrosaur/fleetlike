
class_name ShipDamageProcessor
extends Node2D


@export var health : ShipHealth
@export var ship : Ship


func damage(amount):
	
	amount *= CampaignGlobals.speed_damage_reduction.curve.sample(ship.linear_velocity.length())
	
	health.change_health(-amount)
