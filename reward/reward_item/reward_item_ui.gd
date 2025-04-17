
class_name RewardItemUI
extends CenterContainer


@onready var label: Label = $MarginContainer/VBoxContainer/Label
@onready var selection: TextureRect = $MarginContainer/VBoxContainer/CenterContainer/Selection
@onready var thumbnail: TextureRect = $MarginContainer/VBoxContainer/CenterContainer/Thumbnail

@onready var select_particles: GPUParticles2D = $MarginContainer/VBoxContainer/CenterContainer/Thumbnail/SelectParticles
@onready var reward_particles: GPUParticles2D = $MarginContainer/VBoxContainer/CenterContainer/Thumbnail/RewardParticles

var reward_item_data : RewardItemData


func load_item_and_init(data : RewardItemData):
	reward_item_data = data
	label.text = data.title


func _on_margin_container_mouse_entered() -> void:
	selection.visible = true
	RewardUIEventBus.reward_hovered.emit(self)


func _on_margin_container_mouse_exited() -> void:
	selection.visible = false
	RewardUIEventBus.reward_unhovered.emit(self)


func reward_selected():
	select_particles.restart()


func reward_deselected():
	pass


func reward_rewarded():
	reward_particles.restart()
	reward_particles.reparent(GameGlobals.current_level)
	modulate.a = 0
	


func fade():
	var tween = create_tween()
	tween.tween_interval(0.2)
	tween.tween_property(self, "modulate:a", 0, 0.5)
