
class_name ShipHurtbox
extends Area2D


@export var ship : Ship
@export var health : ShipHealth
@export var armor = 1


func _ready() -> void:
	print("HURTBOX READY: ", ship)

func damage(_damage):
	health.change_health(-_damage)
