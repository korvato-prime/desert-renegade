extends Area2D

func _on_Glitch_body_entered(body):
	get_parent().get_node("CanvasLayer/ParallaxBackground/TextureRect").visible = true
	get_parent().get_node("AudioStreamPlayer").playing = false 
