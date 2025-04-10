
## the rendered manifestation of a ship in battle
## synonymous with unit

class_name Ship
extends Node2D


@onready var selection_sprite: Sprite2D = $SelectionSprite

var player_ship = false
var movement_target : Vector2


## just for an edge case where you unmouse something while its area selected
var is_area_selected = false


func _physics_process(delta: float) -> void:
	pass


# -- selection callbacks


func _on_selection_area_mouse_entered() -> void:
	if player_ship and !is_area_selected: BattleUIEventBus.ship_hovered.emit(self)


func _on_selection_area_mouse_exited() -> void:
	if player_ship and !is_area_selected: BattleUIEventBus.ship_unhovered.emit(self)


func _on_selection_area_area_entered(area: Area2D) -> void:
	if player_ship and area is ShipSelectionArea: 
		#print("selection area entered, ", self)
		is_area_selected = true
		BattleUIEventBus.ship_hovered.emit(self)


func _on_selection_area_area_exited(area: Area2D) -> void:
	if player_ship and area is ShipSelectionArea: 
		#print("selection area exited, ", self)
		is_area_selected = false
		BattleUIEventBus.ship_unhovered.emit(self)


# -- public


func load_ship(ship_data : ShipData):
	global_position = ship_data.spawn_position
	player_ship = ship_data.player_ship


func select_ship():
	print("I was selected: ", self)
	selection_sprite.visible = true


func deselect_ship():
	selection_sprite.visible = false


func set_ship_move_target(new_target):
	pass
