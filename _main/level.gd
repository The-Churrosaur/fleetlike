
class_name Level
extends Node2D

@export var controller : Controller
@export var ui_canvas : UICanvas 
@export var camera : Camera2D

var game_manager : GameManager

func init(game_manager : GameManager):
	self.game_manager = game_manager
