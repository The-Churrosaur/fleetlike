extends Node2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite
@onready var bullet: ShipHitbox = $".."

func _on_bullet_on_hit() -> void:
	
	reparent(GameGlobals.current_level)
	visible = true
	
	animated_sprite.play()
	
	await animated_sprite.animation_looped
	
	queue_free()
