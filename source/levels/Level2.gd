extends Node2D

func _ready():
	Global.looper.play_set(Global.looper.level2)

func _on_Glitch_body_entered(body):
	if body == Global.Player:
		$CanvasLayer/ParallaxBackground/TextureRect.visible = true
		Global.looper.stop()

func _on_Timer_timeout():
	$CanvasLayer2/Control/TextureRect.visible = false

func _on_SurviveTime_timeout():
	Global.change_scene("res://story/Intermission.tscn")

func _on_survivepop_body_entered(body):
	if body == Global.Player:
		$CanvasLayer2/Control/TextureRect.visible = true
		$survivepop.queue_free()
		$Timer.start()
		$SurviveTime.start()
		$Enemies/Spawner.start()
		$Enemies/Spawner2.start()
		$StaticBody2D.position = Vector2(2720, 1026)
