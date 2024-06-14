extends Area2D

@export var damage = 1
@onready var disableTimer = $DisableHitBoxTimer
@onready var collision = $CollisionShape2D

func tempdisable():
	collision.call_deferred("set", "disabled", true)




func _on_disable_hit_box_timer_timeout():
	collision.call_deferred("set", "disabled", false) # Replace with function body.
