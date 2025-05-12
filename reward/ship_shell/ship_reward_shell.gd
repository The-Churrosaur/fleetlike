
class_name ShipRewardShell
extends CenterContainer

@onready var texture_rect: TextureRect = $VBoxContainer/TextureRect
@onready var hover: Control = $Hover
@onready var weapons_label: Label = $VBoxContainer/WeaponsLabel
@onready var abilities_lable: Label = $VBoxContainer/AbilitiesLabel
@onready var item_display: ItemDisplayPopup = $VBoxContainer/ItemDisplay

var ship : Ship
var ship_data : ShipData

func load_ship(ship_data : ShipData):
	self.ship_data = ship_data
	ship = ship_data.ship_scene.instantiate()
	add_child(ship)
	ship.load_ship(ship_data)
	ship.global_position = texture_rect.global_position + texture_rect.size / 2
	
	weapons_label.text = "Weapons: " + str(ship_data.weapons.size()) + "/" + str(ship_data.max_weapons)
	abilities_lable.text = "Abilities: " + str(ship_data.abilities.size()) + "/" + str(ship_data.max_abilities)
	
	item_display.load_ship_data_and_init(ship_data)


func _on_mouse_entered() -> void:
	RewardUIEventBus.ship_shell_hovered.emit(self)


func _on_mouse_exited() -> void:
	RewardUIEventBus.ship_shell_unhovered.emit(self)


func hovered_with_reward():
	#hover.visible = true
	var shake_tween = create_tween()
	shake_tween.set_trans(Tween.TRANS_QUAD)
	shake_tween.tween_property(ship, "global_position", texture_rect.global_position + texture_rect.size / 2 + Vector2(0,-10), 0.2)


func unhovered_with_reward():
	#hover.visible = false
	var shake_tween = create_tween()
	shake_tween.set_trans(Tween.TRANS_QUAD)
	shake_tween.tween_interval(0.2)
	shake_tween.tween_property(ship, "global_position", texture_rect.global_position + texture_rect.size / 2, 0.2)


func ship_reward_rewarded():
	weapons_label.text = "Weapons: " + str(ship_data.weapons.size()) + "/" + str(ship_data.max_weapons)
	abilities_lable.text = "Abilities: " + str(ship_data.abilities.size()) + "/" + str(ship_data.max_abilities)
	
	var rescale_tween = create_tween()
	rescale_tween.tween_property(self, "modulate:a", 0, 0.1)
	rescale_tween.tween_property(self, "modulate:a", 1, 0.1)
	
	await get_tree().create_timer(0.1).timeout
	
	item_display.clear_items()
	item_display.load_ship_data_and_init(ship_data)
	
	ship.global_position = texture_rect.global_position + texture_rect.size / 2
	
	
