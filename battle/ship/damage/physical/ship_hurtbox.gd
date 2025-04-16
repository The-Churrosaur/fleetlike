
class_name ShipHurtbox
extends Area2D


@export var ship : Ship
@export var damage_processor : ShipDamageProcessor
@export var armor = 1


func _ready() -> void:
	print("HURTBOX READY: ", ship)

func damage(_damage):
	damage_processor.damage(_damage)
