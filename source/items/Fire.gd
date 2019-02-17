extends Area2D

func _on_Timer_timeout():
	queue_free()

func _on_Fire_body_entered(body):
	if body == Global.Player:
		body.hurt()
		queue_free()
