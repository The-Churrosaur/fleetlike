extends Node2D

@export var laser_weapon : LaserWeapon

@onready var line_2d: Line2D = $Line2D
@onready var hit_sprite: Node2D = $HitSprite


func _physics_process(delta: float) -> void:
	
	hit_sprite.visible = false
	line_2d.clear_points()
	
	if laser_weapon.target and laser_weapon.damage_target:
		
		var jitter = Vector2(randf_range(-5,5), randf_range(-5,5))
		var target = laser_weapon.target
	
		line_2d.add_point(line_2d.to_local(laser_weapon.muzzle.global_position))
		line_2d.add_point(line_2d.to_local(target.global_position + jitter))
		
		hit_sprite.visible = true
		hit_sprite.global_position = global_position
		hit_sprite.look_at(target.global_position)
		hit_sprite.global_position = target.global_position + jitter
