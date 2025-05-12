extends Level

@onready var ship_reward_shell_container: ShipRewardShellContainer = $UICanvas/ShipRewardShellContainer


func init(game_manager):
	super(game_manager)


func spawn_ships(fleet : FleetData):
	ship_reward_shell_container.load_fleet(fleet)
