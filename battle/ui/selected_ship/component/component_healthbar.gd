extends TextureProgressBar

@export var health : ShipHealth

func _process(delta: float) -> void:
	max_value = health.max_health
	value = health.health
