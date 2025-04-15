
class_name ShipHurtbox
extends Area2D


@export var health : ShipHealth
@export var armor = 1


func damage(_damage):
	health.change_health(-_damage)
