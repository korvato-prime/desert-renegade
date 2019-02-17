extends Area2D

export(int) var value = 3

func _on_Medikit_body_entered(body):
	if body == Global.Player:
		Global.play_pickup()
		body.heal(value)
		queue_free()
