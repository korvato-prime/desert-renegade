extends Node2D

func _on_Glitch_body_entered(body):
	if body == Global.Player:
		$CanvasLayer/ParallaxBackground/TextureRect.visible = true
		$AudioStreamPlayer.playing = false 

func _on_Timer_timeout():
	$CanvasLayer2/Control/TextureRect.visible = false

func _on_SurviveTime_timeout():
	get_tree().change_scene("res://source/boss_arena.tscn")

func _on_survivepop_body_entered(body):
	if body == Global.Player:
		$CanvasLayer2/Control/TextureRect.visible = true
		$survivepop.queue_free()
		$Timer.start()
		$SurviveTime.start()
