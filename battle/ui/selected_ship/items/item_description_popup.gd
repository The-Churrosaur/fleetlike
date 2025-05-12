extends Node2D


@onready var description_label: Label = $MarginContainer2/MarginContainer/DescriptionLabel


func set_text(string : String):
	description_label.text = string


func popup():
	visible = true
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1, 0.1)


func popdown():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0, 0.1)
	await tween.finished
	visible = false
