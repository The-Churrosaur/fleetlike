
class_name SelectedShipUI
extends Node2D


@onready var waypoint_draw: WaypointDraw = $WaypointDraw
@onready var sensor_radius_draw: Node2D = $SensorRadiusDraw
@onready var info_container: CenterContainer = $InfoContainer
@onready var abilities_container: AbilitiesContainer = $InfoContainer/VBoxContainer/AbilitiesContainer
@onready var item_display: ItemDisplayPopup = $InfoContainer/VBoxContainer/ItemDisplay


var ship : Ship


func init(ship):
	self.ship = ship
	
	waypoint_draw.ship = ship
	sensor_radius_draw.init(ship)
	abilities_container.init(ship)
	item_display.load_ship_data_and_init(ship.ship_data)


func toggle_info():
	info_container.visible = !info_container.visible


func _on_info_container_mouse_entered() -> void:
	print("test, info container mouse entered")
