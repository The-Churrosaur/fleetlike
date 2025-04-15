
## damage dealer

class_name ShipHitbox
extends Area2D

@export var damage = 5
@export var hit_chance = 0.5
@export var abrade = true


func _on_area_entered(area: Area2D) -> void:
	if area is ShipHurtbox: 
		if randf() < hit_chance: _on_hit(area)
		else: _on_miss(area)


func _on_hit(area : ShipHurtbox):
	damage -= area.armor
	area.damage(damage)
	if !abrade : damage += area.armor


func _on_miss(area : ShipHurtbox):
	pass
