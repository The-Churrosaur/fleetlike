
class_name ShipAbilityManager
extends Node2D


@export var ship : Ship
@export var abilities : Array[ShipAbility]


func activate_ability(index):
	if abilities.size() > index: abilities[index].activate()
