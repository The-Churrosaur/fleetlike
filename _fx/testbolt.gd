extends Node2D

func _physics_process(delta: float) -> void:
	position += transform.x * 20
