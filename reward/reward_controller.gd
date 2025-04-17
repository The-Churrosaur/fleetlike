extends Controller


@export var reward_scene : RewardScene

var hovered_reward : RewardItemUI
var selected_reward : RewardItemUI
var hovered_ship : ShipRewardShell

var select_enabled = true


func _ready() -> void:
	RewardUIEventBus.reward_hovered.connect(_on_reward_hovered)
	RewardUIEventBus.reward_unhovered.connect(_on_reward_unhovered)
	RewardUIEventBus.ship_shell_hovered.connect(_on_ship_shell_hovered)
	RewardUIEventBus.ship_shell_unhovered.connect(_on_ship_shell_unhovered)


func _physics_process(delta: float) -> void:
	if selected_reward: 
		selected_reward.global_position = get_global_mouse_position() - selected_reward.thumbnail.texture.get_size() / 2


func _unhandled_input(event: InputEvent) -> void:
	
	if select_enabled:
	
		if event.is_action_pressed("ui_click"):
			if hovered_reward: _select_reward(hovered_reward)
		
		if event.is_action_released("ui_click"):
			if selected_reward and hovered_ship: _reward_selected_reward_to_ship()
			elif selected_reward: _deselect_reward(selected_reward)


func _on_reward_hovered(reward_ui):
	hovered_reward = reward_ui


func _on_reward_unhovered(reward_ui):
	if hovered_reward == reward_ui: hovered_reward = null


func _select_reward(reward_ui):
	selected_reward = reward_ui
	reward_ui.reward_selected()


func _deselect_reward(reward_ui):
	selected_reward = null
	reward_ui.reward_deselected()
	
	# hacky but gets it to snap back into the container
	#reward_ui.reparent(self)
	#reward_ui.reparent(reward_scene.rewards_container)


func _on_ship_shell_hovered(shell : ShipRewardShell):
	hovered_ship = shell
	if selected_reward: shell.hover.visible = true


func _on_ship_shell_unhovered(shell : ShipRewardShell):
	if hovered_ship == shell: hovered_ship = null
	shell.hover.visible = false


func _reward_selected_reward_to_ship():
	reward_scene.process_reward(selected_reward, hovered_ship.ship_data)
	selected_reward.reward_rewarded()
	selected_reward = null
	select_enabled = false
	
	for reward in reward_scene.rewards: 
		reward.fade()
		await get_tree().create_timer(0.5).timeout
