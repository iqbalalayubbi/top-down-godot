extends Control

signal sfx(value)
func _on_music_toggled(button_pressed):
	if button_pressed == true:
		get_parent().get_node("music").play()
	else:
		get_parent().get_node("music").stop()
	pass # Replace with function body.


func _on_sfx_toggled(button_pressed):
	if button_pressed == true:
		emit_signal("sfx","hidup")
	else:
		emit_signal("sfx","mati")
	pass # Replace with function body.
