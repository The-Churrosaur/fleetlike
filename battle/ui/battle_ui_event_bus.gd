extends Node

signal ship_spawned(ship : Ship)
signal ship_died(ship : Ship)

signal ship_hovered(ship : Ship)
signal ship_unhovered(ship : Ship)

signal ship_selected(ship : Ship)
signal ship_deselected(ship : Ship)

signal area_select_start()
signal area_select_end()

signal toggle_ship_info()

signal enemy_fleet_defeated()
signal player_fleet_defeated()
