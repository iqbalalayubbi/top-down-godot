extends KinematicBody2D

var arah = Vector2.ZERO
var speed = 100
var sentuhan = false
signal mati
	
func _physics_process(delta):
	z_index = 999
	if (get_parent().has_node("player")):
		arah = get_parent().get_node("player").position - position
		move_and_slide(arah*speed*delta)
	if (get_child(0).rect_size.x <= 0):
		emit_signal("mati")
		queue_free()
		

func _on_Area2D_body_entered(body):
	if body.name == "player":
		sentuhan = true
	pass

func _on_Area2D_body_exited(body):
	if body.name == "player":
		sentuhan = false
	pass # Replace with function body.

func _on_Timer_timeout():
	if (sentuhan == true and get_tree().current_scene.name == "game"):
		get_parent().get_node("darah").rect_size.x -= 5
	pass # Replace with function body.
