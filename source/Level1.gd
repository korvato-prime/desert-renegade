extends Node2D

func _ready():
	Global.looper.play_set(Global.looper.level2)

func _on_Level_exit_body_entered(body):	
	if body == Global.Player and Global.Player.have_card:
		get_tree().change_scene("res://source/Level2.tscn")
		
