extends KinematicBody2D

var velocity = Vector2(1,0)
var speed = 300

func _physics_process(delta):
	var collision_info = move_and_collide(velocity.normalized() * delta*speed)


func _on_Area2D_body_entered(body):
	if (body is StaticBody2D):
		queue_free()
	if ("enemy" in body.name):
		print("kena")
		body.get_child(0).rect_size.x -= 20
		queue_free()
	pass # Replace with function body.
