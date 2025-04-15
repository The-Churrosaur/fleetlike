
class_name BulletMover
extends Node2D

@onready var bullet: ShipHitbox = $".."

@export var velocity = 500

func _physics_process(delta: float) -> void:
	bullet.global_position += bullet.global_transform.x * velocity * delta
