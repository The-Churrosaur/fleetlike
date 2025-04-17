extends Controller


@export var reward_scene : RewardScene

var hovered_reward : RewardItemUI
var selected_reward : RewardItemUI


func _ready() -> void:
	RewardUIEventBus.reward_hovered.connect(_on_reward_hovered)
	RewardUIEventBus.reward_unhovered.connect(_on_reward_unhovered)


func _physics_process(delta: float) -> void:
	if selected_reward: 
		#selected_reward.global_position = lerp(selected_reward.global_position, 
											   #get_global_mouse_position() - Vector2(64,64), 
											   #12.0 * delta)
		selected_reward.global_position = get_global_mouse_position() - selected_reward.thumbnail.texture.get_size() / 2


func _unhandled_input(event: InputEvent) -> void:
	
	if event.is_action_pressed("ui_click"):
		if hovered_reward: _select_reward(hovered_reward)
	
	if event.is_action_released("ui_click"):
		if selected_reward: _deselect_reward(selected_reward)


func _on_reward_hovered(reward_ui):
	hovered_reward = reward_ui


func _on_reward_unhovered(reward_ui):
	if hovered_reward == reward_ui: hovered_reward = null


func _select_reward(reward_ui):
	selected_reward = reward_ui
	reward_ui.reward_selected()
	reward_ui.reparent(self)


func _deselect_reward(reward_ui):
	selected_reward = null
	reward_ui.reward_deselected()
	reward_ui.reparent(reward_scene.rewards_container)
