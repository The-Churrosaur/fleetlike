extends Control


@export var progress_bar : TextureProgressBar
@export var label: Label

var ability : ShipAbility

func init(ability : ShipAbility, i):
	self.ability = ability
	
	# TODO
	var postfix
	if i == 0: postfix = " [q]"
	if i == 1: postfix = " [e]"
	if i == 2: postfix = " [r]"
	
	label.text = ability.ability_name + postfix


func _physics_process(delta: float) -> void:
	if ability:
		progress_bar.max_value = ability.cooldown
		progress_bar.value = ability.cooldown_timer.time_left
