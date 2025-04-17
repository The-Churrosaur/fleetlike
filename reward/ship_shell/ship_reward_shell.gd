
class_name ShipRewardShell
extends CenterContainer

@onready var texture_rect: TextureRect = $TextureRect
@onready var hover: Control = $Hover

var ship : Ship
var ship_data : ShipData

func load_ship(ship_data : ShipData):
	ship = ship_data.ship_scene.instantiate()
	add_child(ship)
	ship.load_ship(ship_data)
	ship.global_position = global_position + texture_rect.texture.get_size() / 2


func _on_mouse_entered() -> void:
	RewardUIEventBus.ship_shell_hovered.emit(self)


func _on_mouse_exited() -> void:
	RewardUIEventBus.ship_shell_unhovered.emit(self)


func ship_reward_rewarded():
	pass
