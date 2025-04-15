extends RigidBody2D


func _on_body_entered(body: Node) -> void:
	print("onbodyentered rock")
	#Engine.time_scale = 0.2
	#await get_tree().create_timer(0.1).timeout
	#Engine.time_scale = 1.0
