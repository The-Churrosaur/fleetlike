
## currently ship's area handles getting hovered through area methods.
## passes through ui bus to battle ui

class_name ShipHoverArea
extends Area2D



@export var ship : Ship

## just for an edge case where you unmouse something while its area selected
var is_area_selected = false


func _on_mouse_entered() -> void:
		if ship.player_ship and !is_area_selected: BattleUIEventBus.ship_hovered.emit(ship)


func _on_mouse_exited() -> void:
	if ship.player_ship and !is_area_selected: BattleUIEventBus.ship_unhovered.emit(ship)


func _on_area_entered(area: Area2D) -> void:
	if ship.player_ship and area is ShipSelectionArea: 
		#print("hover area entered, ", ship)
		is_area_selected = true
		BattleUIEventBus.ship_hovered.emit(ship)


func _on_area_exited(area: Area2D) -> void:
	if ship.player_ship and area is ShipSelectionArea: 
		#print("hover area exited, ", ship)
		is_area_selected = false
		BattleUIEventBus.ship_unhovered.emit(ship)
