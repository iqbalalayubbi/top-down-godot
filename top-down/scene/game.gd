extends Node2D

var enemyPath = preload("res://scene/enemy.tscn")
var darahPath = preload("res://scene/darah.tscn")
var darah = darahPath.instance()
var postButton = Vector2.ZERO
var score = 0
var spawn 
signal mulai 
func _ready():
	$Button3.rect_position = Vector2(800,800)
	$Control.rect_position = Vector2(1035,57)
	spawn =[$kanan.position,$kiri.position,$atas.position,$kanan.position]
	postButton = $Button.rect_position 
	add_child(darah)
	
func _physics_process(delta):
	$SCORE.text = str(score)
	if (has_node("player")):		
		darah.rect_position.x = $player.position.x - 15
		darah.rect_position.y = $player.position.y - 30


func _on_Timer_timeout():
	randomize()
	var randomX = rand_range(0,1024)
	var randomY = rand_range(0,640)
	var enemy = enemyPath.instance()
	add_child(enemy)
	enemy.position = Vector2(randomX,randomY)
	enemy.connect("mati",self,"onEnemyDie")
	pass # Replace with function body.


func _on_Button_pressed():
	emit_signal("mulai")
	if $Button.text == "try again":
		get_tree().reload_current_scene()
	$Button.rect_position = Vector2(367,-123)
	$Timer.start()
	$Button2.rect_position = Vector2(1035,57)
	pass # Replace with function body.


func _on_player_mati():
	$Button.rect_position = postButton
	$Button.text = "try again"
	pass # Replace with function body.

func onEnemyDie():
	score += 1
	
func _on_Button2_pressed():
	$Control.rect_position = Vector2(0,0)
	$Button3.rect_position = Vector2(437,433)
	pass # Replace with function body.

func _on_Button3_pressed():
	$Button3.rect_position = Vector2(1035,57)
	$Control.rect_position = Vector2(1035,57)
	pass # Replace with function body.
