extends Weapon


const PHYSICSBULLET = preload("res://battle/ship/weapons/bullets/physicsbullet.tscn")
const BULLET = preload("res://battle/ship/weapons/bullets/bullet.tscn")

@export var turret_lerp = 4.0

@onready var turret_target: Node2D = $TurretTarget


func _ready() -> void:
	
	while true:
		await get_tree().create_timer(1.0).timeout
		if target : _shoot()


func _physics_process(delta: float) -> void:
	if target: 
		turret_target.look_at(target.global_position)
		#global_rotation = lerp_angle(global_rotation, turret_target.global_rotation, turret_lerp * delta)
		look_at(target.global_position)


func fire_at_target(ship : Ship):
	super(ship)


func _shoot():
	var bullet = BULLET.instantiate()
	GameGlobals.current_level.add_child(bullet)
	bullet.global_transform = muzzle.global_transform
	#bullet.apply_central_impulse(bullet.global_transform.x * 100)
