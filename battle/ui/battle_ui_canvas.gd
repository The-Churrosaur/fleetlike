
class_name BattleUICanvas
extends UICanvas


## get a coordinate from the current level's global coordinate in camera space
static func global_to_canvas(global_position, reference = GameGlobals.current_level):
	return reference.get_global_transform_with_canvas() * global_position


static func get_canvas_scale(reference = GameGlobals.current_level):
	return reference.get_global_transform_with_canvas().get_scale().x


@onready var victory_ui: CenterContainer = $VictoryUI
@onready var defeat_ui: CenterContainer = $DefeatUI


func _ready() -> void:
	BattleUIEventBus.player_fleet_defeated.connect(_on_player_fleet_defeated)
	BattleUIEventBus.enemy_fleet_defeated.connect(_on_enemy_fleet_defeated)


func _on_player_fleet_defeated():
	defeat_ui.visible = true


func _on_enemy_fleet_defeated():
	victory_ui.visible = true
