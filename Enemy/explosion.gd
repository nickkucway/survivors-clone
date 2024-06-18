extends Sprite2D

const dmg_num = preload("res://Enemy/dmg_num.tscn")
@onready var dmg_num_canvas = %dmg_canvas
var new_dmg_num = 0

func _ready():
	$AnimationPlayer.play("explode")
	var new_dmg = dmg_num.instantiate()
	new_dmg.global_position = global_position
	new_dmg.text = str(new_dmg_num)
	dmg_num_canvas.call_deferred('add_child', new_dmg)


func _on_animation_player_animation_finished(_anim_name):
	queue_free() # Replace with function body.

func update_damage(dmg):
	new_dmg_num = dmg


