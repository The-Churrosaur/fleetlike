extends CanvasLayer


@onready var rect: ColorRect = $rect


func fade_out():
	var tween = create_tween()
	tween.tween_property(rect, "color:a", 1, 0.5)


func fade_in():
	var tween = create_tween()
	tween.tween_property(rect, "color:a", 0, 1.0)
