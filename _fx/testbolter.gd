extends Node2D

const TESTBOLT = preload("res://_fx/testbolt.tscn")


func _ready() -> void:
	
	while true:
		await  get_tree().create_timer(2.0 + randf()).timeout
		
		var rand = randf() * PI * 2
		
		for i in 3:
			var bolt = TESTBOLT.instantiate()
			GameGlobals.current_level.add_child(bolt)
			bolt.global_position = global_position
			bolt.rotation = rand
			
			await get_tree().create_timer(0.2).timeout
