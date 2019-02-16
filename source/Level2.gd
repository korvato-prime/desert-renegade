extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Glitch_body_entered(body):
	if "BadassCactus" in body:
		get_parent().get_node("CanvasLayer/ParallaxBackground/TextureRect").visible = true
		get_parent().get_node("AudioStreamPlayer").playing = false 

func _on_Timer_timeout():
	$CanvasLayer2/Control/TextureRect.visible = false

func _on_SurviveTime_timeout():
	get_tree().change_scene("res://source/boss_arena.tscn")
