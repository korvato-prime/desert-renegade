extends Node2D

func _on_Glitch_body_entered(body):
	if "BadassCactus" in body:
		get_parent().get_node("CanvasLayer/ParallaxBackground/TextureRect").visible = true
		get_parent().get_node("AudioStreamPlayer").playing = false 

func _on_Timer_timeout():
	$CanvasLayer2/Control/TextureRect.visible = false

func _on_SurviveTime_timeout():
	get_tree().change_scene("res://source/boss_arena.tscn")
