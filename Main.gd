extends Node2D

func _ready():
	Global.looper.play_set(Global.looper.level1)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		Global.change_scene(Global.Intro)
