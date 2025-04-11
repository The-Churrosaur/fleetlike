
class_name Utils
extends Node


## canvas 

static func world_to_canvas(calling : CanvasItem, global_position : Vector2):
	return calling.get_viewport_transform() * global_position + calling.get_viewport_rect().size / 2
