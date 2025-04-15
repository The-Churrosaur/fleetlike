extends Node2D

var ship
var circles : Array[float]

func  _physics_process(delta: float) -> void:
	queue_redraw()


func init(ship):
	self.ship = ship
	var fcm = ship.fire_control_manager
	for sensor in fcm.sensors:
		circles.append(sensor.get_children()[0].shape.radius)
	print("circles init: ", circles)

func _draw() -> void:
	for circle in circles:
		draw_circle(Vector2.ZERO, circle * BattleUICanvas.get_canvas_scale(), Color.GREEN, false)
