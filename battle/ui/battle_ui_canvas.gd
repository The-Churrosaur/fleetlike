
class_name BattleUICanvas
extends UICanvas


## get a coordinate from the current level's global coordinate in camera space
static func global_to_canvas(global_position, reference = GameGlobals.current_level):
	return reference.get_global_transform_with_canvas() * global_position
