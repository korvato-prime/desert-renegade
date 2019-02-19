extends Node2D

func _ready():
	Global.looper.play_set(Global.looper.level1)

func _on_Button_pressed():
	Global.change_scene("res://source/BossArena.tscn")
