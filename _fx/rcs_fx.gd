
class_name RCSFX
extends Node2D

@export var clockwise : Array[AnimatedSprite2D]
@export var countercl : Array[AnimatedSprite2D]

func rotate_clockwise():
	for sprite in clockwise: sprite.visible = true

func rotate_counterclock():
	for sprite in countercl: sprite.visible = true

func stop_rotating():
	for sprite in clockwise: sprite.visible = false
	for sprite in countercl: sprite.visible = false
