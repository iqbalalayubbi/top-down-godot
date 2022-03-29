extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 200
var bulletPath = preload("res://scene/bullet.tscn")
signal mati
var mulai = false
var sfx = false

func _physics_process(delta):
	z_index = 999
	var darah = get_parent().get_node("darah")
	if darah.rect_size.x <= 0:
		emit_signal("mati")
		queue_free()
		
	if mulai == true:
		look_at(get_global_mouse_position())
		if Input.is_action_just_pressed("fire"):
			fire()
			if sfx:
				get_parent().get_node("sfx").play()
		if Input.is_action_pressed("up"):
			velocity.y += -1

		if Input.is_action_pressed("down"):
			velocity.y += 1
			
		if Input.is_action_pressed("left"):
			velocity.x += -1
			
		if Input.is_action_pressed("right"):
			velocity.x += 1
			#velocity.x = 0 
			#velocity.y = 0
		move_and_slide(velocity*delta*speed)
		$Node2D.look_at(get_global_mouse_position())
			
func fire():
	var bullet = bulletPath.instance()
	get_parent().add_child(bullet)
	bullet.position = $Node2D/Position2D.global_position
	bullet.velocity = get_global_mouse_position() - bullet.position

func _on_game_mulai():
	mulai = true
	pass # Replace with function body.


func _on_Control_sfx(value):
	sfx = value
	pass # Replace with function body.

