
class_name RewardItemUI
extends CenterContainer


@onready var label: Label = $MarginContainer/VBoxContainer/Label
@onready var selection: TextureRect = $MarginContainer/VBoxContainer/CenterContainer/Selection
@onready var thumbnail: TextureRect = $MarginContainer/VBoxContainer/CenterContainer/Thumbnail

var reward_item : RewardItem


func init(reward_item : RewardItem):
	self.reward_item = reward_item
	label.text = reward_item.data.title


func _on_margin_container_mouse_entered() -> void:
	selection.visible = true
	RewardUIEventBus.reward_hovered.emit(self)


func _on_margin_container_mouse_exited() -> void:
	selection.visible = false
	RewardUIEventBus.reward_unhovered.emit(self)


func reward_selected():
	pass


func reward_deselected():
	#var return_tween = create_tween()
	#return_tween.tween_property(self, "position", Vector2.ZERO, 1.0)
	pass
