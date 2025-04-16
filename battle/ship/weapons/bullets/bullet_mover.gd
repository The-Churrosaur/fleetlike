
class_name BulletMover
extends Node2D

@onready var bullet: ShipHitbox = $".."
@onready var target_looker: Node2D = $TargetLooker

@export var velocity = 500
@export var lifetime = 3.0

var current_lifetime = 0

func _physics_process(delta: float) -> void:
	bullet.global_position += bullet.global_transform.x * velocity * delta
	
	if bullet.target:
		print("bullet has target lerping")
		target_looker.look_at(bullet.target.global_position)
		bullet.global_rotation = lerp_angle(bullet.global_rotation, target_looker.global_rotation, 1.0 * delta)
	
	current_lifetime += delta
	if current_lifetime > lifetime: bullet._explode()
