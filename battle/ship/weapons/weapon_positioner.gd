
class_name WeaponPositioner
extends Node2D


@export var positions : Array[Marker2D]
@export var ship : Ship


func add_weapon(weapon, index):
	weapon.global_position = positions[index].global_position
	weapon.ship = ship
