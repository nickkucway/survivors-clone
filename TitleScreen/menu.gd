extends Control

var level = "res://Ship/world.tscn"


func _on_btn_play_click_end():
	var _level = get_tree().change_scene_to_file(level)



func _on_btn_exit_click_end():
	get_tree().quit()

func _physics_process(_delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
