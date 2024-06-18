extends CharacterBody2D

@export var movement_speed = 20.0
@export var hp = 10.0
@export var knockback_recovery = 3.5
@export var experience = 1
@export var enemy_damage = 1
var knockback = Vector2.ZERO

@onready var player = get_tree().get_first_node_in_group('player')
@onready var loot_base = get_tree().get_first_node_in_group('loot')
@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var snd_hit = $snd_hit
@onready var hitBox = $HitBox
@onready var dmg_num_canvas = %dmg_num_canvas




var death_anim = preload("res://Enemy/explosion.tscn")
var exp_gem = preload('res://Objects/experience_gem.tscn')
var dmg_num = preload("res://Enemy/dmg_num.tscn")

signal remove_from_array(object)

func _ready():
	animation_player.play("walk")
	hitBox.damage = enemy_damage


func _physics_process(_delta):
	knockback = knockback.move_toward(Vector2.ZERO, knockback_recovery)
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*movement_speed
	velocity += knockback
	move_and_slide()
	
	if direction.x > 0.1:
		sprite.flip_h = true
	elif direction.x < -0.1:
		sprite.flip_h = false

func death(dmg):
		emit_signal('remove_from_array', self)
		var enemy_death = death_anim.instantiate()
		enemy_death.update_damage(dmg)
		enemy_death.scale = sprite.scale
		enemy_death.global_position = global_position
		get_parent().call_deferred("add_child", enemy_death)
		var new_gem = exp_gem.instantiate()
		new_gem.global_position = global_position
		new_gem.experience = experience
		loot_base.call_deferred('add_child', new_gem)
		queue_free()

func _on_hurt_box_hurt(damage, angle, knockback_amount):
	hp -= damage
	knockback = angle * knockback_amount
	var new_dmg = dmg_num.instantiate()
	new_dmg.global_position = global_position
	new_dmg.text = str(damage)
	dmg_num_canvas.call_deferred('add_child', new_dmg)
	if hp <= 0:
		death(damage)
	else:
		snd_hit.play()
