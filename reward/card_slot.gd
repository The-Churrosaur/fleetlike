extends Container


@onready var inner_container: CenterContainer = $InnerContainer


func _on_mouse_exited() -> void:
	var shake_tween = create_tween()
	shake_tween.set_trans(Tween.TRANS_QUAD)
	shake_tween.tween_property(inner_container, "global_position", global_position + Vector2(0, 10), 0.2)


func _on_mouse_entered() -> void:
	var shake_tween = create_tween()
	shake_tween.set_trans(Tween.TRANS_QUAD)
	shake_tween.tween_property(inner_container, "global_position", global_position, 0.2)


func get_center():
	return global_position
