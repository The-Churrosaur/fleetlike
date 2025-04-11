extends Sprite2D

@export var mult = 10

func _physics_process(delta: float) -> void:
	global_position = get_parent().global_position + GameGlobals.drop_light_direction * mult
	
