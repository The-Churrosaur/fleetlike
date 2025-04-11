extends Sprite2D

func _physics_process(delta: float) -> void:
	
	global_position = GameGlobals.current_level.camera.global_position
