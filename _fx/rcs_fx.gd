
class_name RCSFX
extends Node2D


@export var ship_mover : ShipMover

@export var clockwise : Array[AnimatedSprite2D]
@export var countercl : Array[AnimatedSprite2D]


func _physics_process(delta: float) -> void:
	
	var rotate_clockwise = false
	var rotate_counter = false
	
	var angle = ship_mover.turn_angle
	
	if angle and abs(angle) > 0.1:
		if angle > 0: rotate_clockwise = true
		else: rotate_counter = true 
	
	for sprite in clockwise: 
		sprite.visible = rotate_clockwise
	for sprite in countercl:
		sprite.visible = rotate_counter
