
class_name ShipRewardShell
extends CenterContainer

@onready var texture_rect: TextureRect = $TextureRect

var ship : Ship

func load_ship(ship_data : ShipData):
	ship = ship_data.ship_scene.instantiate()
	add_child(ship)
	ship.load_ship(ship_data)
	ship.global_position = global_position + texture_rect.texture.get_size() / 2
