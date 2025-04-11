
class_name HoverSpriteManager
extends Node2D


const HOVER_SPRITE = preload("res://battle/ui/selection/hover_sprite.tscn")

var ships = {}


func _ready() -> void:
	BattleUIEventBus.ship_hovered.connect(_on_ship_hovered)
	BattleUIEventBus.ship_unhovered.connect(_on_ship_unhovered)


func _physics_process(delta: float) -> void:
	
	
	for ship in ships:
		ships[ship].global_position = BattleUICanvas.global_to_canvas(ship.global_position)


func _on_ship_hovered(ship):
	
	if ships.has(ship): return
	
	var sprite = HOVER_SPRITE.instantiate()
	add_child(sprite)
	ships[ship] = sprite


func _on_ship_unhovered(ship):
	
	if !ships.has(ship): return
	
	ships[ship].queue_free()
	ships.erase(ship)
