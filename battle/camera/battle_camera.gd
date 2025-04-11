extends Camera2D

@export var speed = 40.0
@export var zoom_out_amount = 1.1
@export var zoom_in_amount = 0.9


var move_left = 0.0
var move_right = 0.0
var move_up = 0.0
var move_down = 0.0


func _physics_process(delta: float) -> void:
		var dx = Vector2(move_right - move_left, move_down - move_up) * delta * speed
		position += dx


func _unhandled_input(event: InputEvent) -> void:
	
	if event.is_action_pressed("ui_left"): move_left = 1.0
	if event.is_action_released("ui_left"): move_left = 0.0
	
	if event.is_action_pressed("ui_right"): move_right = 1.0
	if event.is_action_released("ui_right"): move_right = 0.0
	
	if event.is_action_pressed("ui_up"): move_up = 1.0
	if event.is_action_released("ui_up"): move_up = 0.0
	
	if event.is_action_pressed("ui_down"): move_down = 1.0
	if event.is_action_released("ui_down"): move_down = 0.0
	
	if event.is_action("ui_scroll_down"): _zoom_in()
	if event.is_action("ui_scroll_up"): _zoom_out()


func _zoom_out():
	zoom *= zoom_out_amount


func _zoom_in():
	zoom *= zoom_in_amount
