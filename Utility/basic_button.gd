extends Button

@onready var snd_hover = $snd_hover
@onready var snd_click = $snd_click

signal click_end()


func _on_mouse_entered():
	snd_hover.play() # Replace with function body.


func _on_pressed():
	snd_click.play() # Replace with function body.


func _on_snd_click_finished():
	emit_signal('click_end') # Replace with function body.
