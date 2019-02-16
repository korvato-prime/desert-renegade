extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		Global.change_scene(Global.Intro)
