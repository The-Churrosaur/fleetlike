
class_name RewardItemUI
extends CenterContainer


@onready var label: Label = $MarginContainer/VBoxContainer/Label
@onready var selection: TextureRect = $MarginContainer/VBoxContainer/CenterContainer/Selection
@onready var thumbnail: TextureRect = $MarginContainer/VBoxContainer/CenterContainer/Thumbnail

@onready var select_particles: GPUParticles2D = $MarginContainer/VBoxContainer/CenterContainer/Thumbnail/SelectParticles
@onready var reward_particles: GPUParticles2D = $MarginContainer/VBoxContainer/CenterContainer/Thumbnail/RewardParticles

@onready var description_popup: Node2D = $DescriptionPopup

var reward_item_data : RewardItemData

var selected = false


func load_item_and_init(data : RewardItemData):
	reward_item_data = data
	label.text = data.title
	thumbnail.texture = data.thumbnail
	description_popup.set_text(data.description)


func _on_margin_container_mouse_entered() -> void:
	selection.visible = true
	RewardUIEventBus.reward_hovered.emit(self)
	
	description_popup.popup()
	
	#if !selected:
		#var shake_tween = create_tween()
		#shake_tween.set_trans(Tween.TRANS_QUAD)
		#shake_tween.tween_property(self, "position", position + Vector2(0,10), 0.2)


func _on_margin_container_mouse_exited() -> void:
	selection.visible = false
	RewardUIEventBus.reward_unhovered.emit(self)
	
	description_popup.popdown()
	
	#if !selected:
		#var shake_tween = create_tween()
		#shake_tween.set_trans(Tween.TRANS_QUAD)
		#shake_tween.tween_property(self, "position", position - Vector2(0,10), 0.2)


func reward_selected():
	select_particles.restart()
	selected = true


func reward_deselected():
	selected = false


func reward_rewarded():
	reward_particles.restart()
	reward_particles.reparent(GameGlobals.current_level)
	modulate.a = 0
	


func fade():
	var tween = create_tween()
	tween.tween_interval(0.2)
	tween.tween_property(self, "modulate:a", 0, 0.5)
