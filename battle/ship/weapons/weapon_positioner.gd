
class_name WeaponPositioner
extends Node2D


@export var positions : Array[Marker2D]


func add_weapon(weapon, index):
	weapon.global_position = positions[index].global_position
