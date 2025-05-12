
class_name ItemUI
extends MarginContainer


@onready var texture_rect: TextureRect = $VBoxContainer/TextureRect
@onready var label: Label = $VBoxContainer/Label
@onready var description_popup: Node2D = $VBoxContainer/DescriptionPopup


var item_data : RewardItemData


func load_item_and_init(item_data : RewardItemData):
	print("item ui loading: ", item_data.title)
	self.item_data = item_data
	texture_rect.texture = item_data.thumbnail
	label.text = item_data.title
	description_popup.set_text(item_data.description)


func _on_mouse_entered() -> void:
	description_popup.popup()


func _on_mouse_exited() -> void:
	description_popup.popdown()
