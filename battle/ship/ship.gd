
## the rendered manifestation of a ship in battle

class_name Ship
extends RigidBody2D

signal ship_died(ship)


@onready var waypoint_manager: ShipWaypointManager = $WaypointManager
@onready var ship_damage_processor: ShipDamageProcessor = $ShipDamageProcessor
@onready var ship_health: ShipHealth = $ShipHealth
@onready var fire_control_manager: FireControlManager = $FireControlManager
@onready var ship_ability_manager: ShipAbilityManager = $ShipAbilityManager
@onready var weapon_positioner: WeaponPositioner = $FireControlManager/WeaponPositioner
@onready var ship_mover: ShipMover = $ShipMover
@onready var ship_shield: ShipShield = $ShipShield


var ship_data : ShipData
var player_ship = false
var faction : CampaignGlobals.FACTIONS


func _ready() -> void:
	init_components()


func _on_ship_health_health_zero() -> void:
	kill_ship()


# -- public


func load_ship(ship_data : ShipData):
	
	self.ship_data = ship_data
	
	player_ship = ship_data.player_ship
	faction = ship_data.faction
	
	var weapons = ship_data.weapons
	for i in weapons.size():
		var weapon = weapons[i].scene.instantiate()
		fire_control_manager.add_weapon(weapon)
		weapon_positioner.add_weapon(weapon, i)
	
	var abilities = ship_data.abilities
	for i in abilities.size():
		var ability = abilities[i].scene.instantiate()
		ship_ability_manager.add_ability(ability)


func kill_ship():
	ship_died.emit(self)
	await get_tree().create_timer(2.0).timeout
	queue_free()


func select_ship():
	pass


func deselect_ship():
	pass


func init_components():
	fire_control_manager.init(self)
