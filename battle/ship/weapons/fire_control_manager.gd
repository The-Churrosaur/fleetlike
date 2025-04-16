
## intermediary between sensors and weapons

class_name FireControlManager
extends Node2D


@export var sensors : Array[Sensor]
@export var weapons : Array[Weapon]

var ship : Ship


func _ready() -> void:
	
	while true:
		await get_tree().create_timer(1.0).timeout
		assign_targets_and_fire()


func init(ship):
	self.ship = ship
	for sensor in sensors: sensor.ship = ship
	for weapon in weapons: weapon.ship = ship


func fire_at_target(ship : Ship):
	for weapon in weapons: if !weapon.target: weapon.fire_at_target(ship)


func cease_fire():
	for weapon in weapons: weapon.cease_fire()


func assign_targets_and_fire():
	var contacts = []
	for sensor in sensors:
		contacts.append_array(sensor.contacts.values())
	
	#print("Assigning contacts: ", contacts)
	
	if !contacts.is_empty(): fire_at_target(contacts[randi_range(0, contacts.size() - 1)]) # TODO
	else: cease_fire()
