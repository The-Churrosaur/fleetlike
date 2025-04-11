
class_name ShipSelectionManager
extends Node2D


const HOVER_SPRITE = preload("res://battle/ui/selection/hover_sprite.tscn")
const SELECTION_SPRITE = preload("res://battle/ui/selection/selection_sprite.tscn")

@onready var selection_area: ShipSelectionArea = $SelectionArea

var hovered_ships = {} # ship -> hover sprite
var selected_ships = {} # ship -> selection sprite



func _ready() -> void:
	
	BattleUIEventBus.ship_hovered.connect(_on_ship_hovered)
	BattleUIEventBus.ship_unhovered.connect(_on_ship_unhovered)


func _physics_process(delta: float) -> void:
	
	# sprite management
	for ship in hovered_ships:
		hovered_ships[ship].global_position = ship.global_position
	for ship in selected_ships:
		selected_ships[ship].global_position = ship.global_position


func _on_ship_hovered(ship):
	if !hovered_ships.has(ship): 
		
		# sprite
		var hover_sprite = HOVER_SPRITE.instantiate()
		add_child(hover_sprite)
		
		# add to dict
		hovered_ships[ship] = hover_sprite


func _on_ship_unhovered(ship):
	if hovered_ships.has(ship): 
		
		# free sprite
		hovered_ships[ship].queue_free()
		
		# remove from dict
		hovered_ships.erase(ship)


func select_ships():
	
	# deselect all
	for ship : Ship in selected_ships.keys(): _deselect_ship(ship)
	
	# hovered -> selected
	for ship in hovered_ships.keys(): _select_ship(ship)


func start_area_selection():
	selection_area.start_selection(get_global_mouse_position())


func end_area_selection():
	selection_area.end_selection()
	#print("selection ended: ", hovered_ships)


func _select_ship(ship : Ship):
	
	var sprite = SELECTION_SPRITE.instantiate()
	add_child(sprite)
	
	ship.select_ship()
	selected_ships[ship] = sprite


func _deselect_ship(ship : Ship):
	
	selected_ships[ship].queue_free()
	ship.deselect_ship()
	selected_ships.erase(ship)
