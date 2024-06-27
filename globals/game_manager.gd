extends Node

var player_town:Node

var level = "res://World/world.tscn"

func set_player(player_node):
	player_town = player_node

func _physics_process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()

func _load_first_level():
	var _level = get_tree().change_scene_to_file(level)
