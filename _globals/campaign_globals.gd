extends Node

enum FACTIONS {PLAYER, ALLIED, ENEMY}

var faction_enemies = {
		FACTIONS.PLAYER: [FACTIONS.ENEMY],
		FACTIONS.ENEMY: [FACTIONS.PLAYER, FACTIONS.ALLIED],
		FACTIONS.ALLIED: [FACTIONS.ENEMY]
	}

@export var rear_damage_mult = 2.0

@export var speed_damage_reduction : CurveTexture
