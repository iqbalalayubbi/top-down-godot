tool
extends Container

var rectPath = preload("res://addons/button/button.tscn")

func _enter_tree():
	var rect = rectPath.instance()
	get_parent().add_child(rect)
