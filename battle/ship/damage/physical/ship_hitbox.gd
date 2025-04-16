
## damage dealer

class_name ShipHitbox
extends Area2D


signal on_hit()

@export var damage = 5
@export var hit_chance = 0.5
@export var abrade = true
@export var free_on_hit = true

var ship = null
var target = null


func _on_area_entered(area: Area2D) -> void:
	if area is ShipHurtbox and ship and area.ship and CampaignGlobals.enemies(ship, area.ship):
		if randf() < hit_chance : _on_hit(area)
		else: _on_miss(area)


func _on_hit(area : ShipHurtbox):
	damage -= area.armor
	area.damage(damage)
	if !abrade : damage += area.armor
	_explode()


func _on_miss(area : ShipHurtbox):
	pass


func _explode():
	on_hit.emit()
	if free_on_hit: queue_free()
